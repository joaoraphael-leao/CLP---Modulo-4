-- =====================================================
-- MIGRAÇÃO: Criação de todas as tabelas do sistema
-- Baseado nos models do projeto
-- =====================================================

-- Tabela de Especialidades (deve ser criada primeiro)
CREATE TABLE IF NOT EXISTS especialidades (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    requisitos TEXT,
    ativa BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Médicos
CREATE TABLE IF NOT EXISTS medicos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    crm VARCHAR(20) NOT NULL UNIQUE,
    especialidade_id INTEGER NOT NULL REFERENCES especialidades(id),
    ativo BOOLEAN DEFAULT true,
    telefone VARCHAR(20),
    email VARCHAR(100),
    local_atendimento VARCHAR(200),
    tempo_padrao_consulta DECIMAL(5,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Pacientes
CREATE TABLE IF NOT EXISTS pacientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20),
    endereco TEXT,
    internado BOOLEAN DEFAULT false,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Consultas
CREATE TABLE IF NOT EXISTS consultas (
    id SERIAL PRIMARY KEY,
    data_consulta TIMESTAMP NOT NULL,
    paciente_id INTEGER NOT NULL REFERENCES pacientes(id),
    medico_id INTEGER NOT NULL REFERENCES medicos(id),
    sintomas TEXT,
    diagnostico TEXT,
    prescricao TEXT,
    status VARCHAR(20) DEFAULT 'agendada',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Exames
CREATE TABLE IF NOT EXISTS exames (
    id SERIAL PRIMARY KEY,
    medico_id INTEGER NOT NULL REFERENCES medicos(id),
    paciente_id INTEGER NOT NULL REFERENCES pacientes(id),
    tipo_exame VARCHAR(100) NOT NULL,
    data_exame TIMESTAMP NOT NULL,
    precisa_imagem BOOLEAN DEFAULT false,
    resultado_exame TEXT,
    status VARCHAR(20) DEFAULT 'solicitado',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Imagens
CREATE TABLE IF NOT EXISTS imagens (
    id SERIAL PRIMARY KEY,
    exame_id INTEGER NOT NULL REFERENCES exames(id),
    url VARCHAR(500) NOT NULL,
    descricao TEXT,
    tipo_arquivo VARCHAR(10),
    tamanho_arquivo BIGINT,
    hash_arquivo VARCHAR(64),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Laudos
CREATE TABLE IF NOT EXISTS laudos (
    id SERIAL PRIMARY KEY,
    exame_id INTEGER NOT NULL REFERENCES exames(id),
    medico_id INTEGER NOT NULL REFERENCES medicos(id),
    conteudo TEXT NOT NULL,
    status VARCHAR(20) DEFAULT 'pendente',
    observacoes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Prontuários
CREATE TABLE IF NOT EXISTS prontuarios (
    id SERIAL PRIMARY KEY,
    paciente_id INTEGER NOT NULL REFERENCES pacientes(id),
    medico_id INTEGER NOT NULL REFERENCES medicos(id),
    historico_medico TEXT,
    alergias TEXT,
    medicamentos TEXT,
    observacoes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Entradas do Prontuário
CREATE TABLE IF NOT EXISTS prontuario_entradas (
    id SERIAL PRIMARY KEY,
    prontuario_id INTEGER NOT NULL REFERENCES prontuarios(id),
    tipo VARCHAR(50) NOT NULL,
    descricao TEXT NOT NULL,
    observacoes TEXT,
    medico_id INTEGER REFERENCES medicos(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Notificações
CREATE TABLE IF NOT EXISTS notificacoes (
    id SERIAL PRIMARY KEY,
    destinatario_id INTEGER NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    titulo VARCHAR(200) NOT NULL,
    mensagem TEXT NOT NULL,
    status VARCHAR(20) DEFAULT 'nao_lida',
    tipo_destinatario VARCHAR(20),
    remetente_id INTEGER,
    dados_extras JSONB,
    lida_em TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Log de Notificações
CREATE TABLE IF NOT EXISTS log_notificacoes (
    id SERIAL PRIMARY KEY,
    notificacao_id INTEGER NOT NULL REFERENCES notificacoes(id),
    acao VARCHAR(50) NOT NULL,
    detalhes TEXT,
    usuario_id INTEGER,
    ip_origem INET,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Alertas Críticos
CREATE TABLE IF NOT EXISTS alertas_criticos (
    id SERIAL PRIMARY KEY,
    paciente_id INTEGER NOT NULL REFERENCES pacientes(id),
    medico_id INTEGER NOT NULL REFERENCES medicos(id),
    tipo VARCHAR(50) NOT NULL,
    descricao TEXT NOT NULL,
    status VARCHAR(20) DEFAULT 'ativo',
    prioridade VARCHAR(10) DEFAULT 'media',
    observacoes TEXT,
    observacoes_resolucao TEXT,
    resolvido_em TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Agenda Ocupada
CREATE TABLE IF NOT EXISTS agenda_ocupada (
    id SERIAL PRIMARY KEY,
    medico_id INTEGER NOT NULL REFERENCES medicos(id),
    data_hora TIMESTAMP NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(medico_id, data_hora)
);

-- =====================================================
-- ÍNDICES PARA PERFORMANCE
-- =====================================================

-- Índices para consultas frequentes
CREATE INDEX IF NOT EXISTS idx_medicos_especialidade ON medicos(especialidade_id);
CREATE INDEX IF NOT EXISTS idx_medicos_ativo ON medicos(ativo);
CREATE INDEX IF NOT EXISTS idx_pacientes_cpf ON pacientes(cpf);
CREATE INDEX IF NOT EXISTS idx_pacientes_internado ON pacientes(internado);
CREATE INDEX IF NOT EXISTS idx_consultas_medico_data ON consultas(medico_id, data_consulta);
CREATE INDEX IF NOT EXISTS idx_consultas_paciente ON consultas(paciente_id);
CREATE INDEX IF NOT EXISTS idx_exames_medico ON exames(medico_id);
CREATE INDEX IF NOT EXISTS idx_exames_paciente ON exames(paciente_id);
CREATE INDEX IF NOT EXISTS idx_imagens_exame ON imagens(exame_id);
CREATE INDEX IF NOT EXISTS idx_laudos_exame ON laudos(exame_id);
CREATE INDEX IF NOT EXISTS idx_laudos_medico ON laudos(medico_id);
CREATE INDEX IF NOT EXISTS idx_prontuarios_paciente ON prontuarios(paciente_id);
CREATE INDEX IF NOT EXISTS idx_prontuarios_medico ON prontuarios(medico_id);
CREATE INDEX IF NOT EXISTS idx_notificacoes_destinatario ON notificacoes(destinatario_id);
CREATE INDEX IF NOT EXISTS idx_notificacoes_status ON notificacoes(status);
CREATE INDEX IF NOT EXISTS idx_alertas_criticos_paciente ON alertas_criticos(paciente_id);
CREATE INDEX IF NOT EXISTS idx_alertas_criticos_status ON alertas_criticos(status);
CREATE INDEX IF NOT EXISTS idx_agenda_ocupada_medico_data ON agenda_ocupada(medico_id, data_hora);

-- =====================================================
-- TRIGGERS PARA UPDATED_AT
-- =====================================================

-- Função para atualizar updated_at
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Triggers para updated_at
CREATE TRIGGER update_especialidades_updated_at BEFORE UPDATE ON especialidades FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_medicos_updated_at BEFORE UPDATE ON medicos FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_pacientes_updated_at BEFORE UPDATE ON pacientes FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_consultas_updated_at BEFORE UPDATE ON consultas FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_exames_updated_at BEFORE UPDATE ON exames FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_imagens_updated_at BEFORE UPDATE ON imagens FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_laudos_updated_at BEFORE UPDATE ON laudos FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_prontuarios_updated_at BEFORE UPDATE ON prontuarios FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_notificacoes_updated_at BEFORE UPDATE ON notificacoes FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_alertas_criticos_updated_at BEFORE UPDATE ON alertas_criticos FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- =====================================================
-- DADOS INICIAIS
-- =====================================================

-- Inserir especialidades básicas
INSERT INTO especialidades (nome, descricao) VALUES
('Cardiologia', 'Especialidade médica que trata do coração e sistema cardiovascular'),
('Neurologia', 'Especialidade médica que trata do sistema nervoso'),
('Ortopedia', 'Especialidade médica que trata do sistema musculoesquelético'),
('Pediatria', 'Especialidade médica que trata de crianças e adolescentes'),
('Dermatologia', 'Especialidade médica que trata da pele e anexos')
ON CONFLICT DO NOTHING;

-- =====================================================
-- COMENTÁRIOS DAS TABELAS
-- =====================================================

COMMENT ON TABLE especialidades IS 'Tabela de especialidades médicas';
COMMENT ON TABLE medicos IS 'Tabela de médicos do sistema';
COMMENT ON TABLE pacientes IS 'Tabela de pacientes do sistema';
COMMENT ON TABLE consultas IS 'Tabela de consultas médicas';
COMMENT ON TABLE exames IS 'Tabela de exames médicos';
COMMENT ON TABLE imagens IS 'Tabela de imagens dos exames';
COMMENT ON TABLE laudos IS 'Tabela de laudos médicos';
COMMENT ON TABLE prontuarios IS 'Tabela de prontuários dos pacientes';
COMMENT ON TABLE prontuario_entradas IS 'Tabela de entradas do prontuário';
COMMENT ON TABLE notificacoes IS 'Tabela de notificações do sistema';
COMMENT ON TABLE log_notificacoes IS 'Tabela de log das notificações';
COMMENT ON TABLE alertas_criticos IS 'Tabela de alertas críticos';
COMMENT ON TABLE agenda_ocupada IS 'Tabela de horários ocupados na agenda';
