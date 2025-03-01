-- ==============================
-- Tabela Perfil (Superclasse)
-- ==============================
CREATE TABLE Perfil (
    id_perfil SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha TEXT NOT NULL
);

-- ==============================
-- Tabela Usuário (Especialização de Perfil)
-- ==============================
CREATE TABLE Usuario (
    id_perfil INT PRIMARY KEY,  
    idioma_preferido VARCHAR(50) DEFAULT 'Português',
    FOREIGN KEY (id_perfil) REFERENCES Perfil(id_perfil) ON DELETE CASCADE
);

-- ==============================
-- Tabela Administrador (Especialização de Perfil)
-- ==============================
CREATE TABLE Administrador (
    id_perfil INT PRIMARY KEY,  
    nivel_acesso VARCHAR(50) NOT NULL CHECK (nivel_acesso IN ('super', 'moderador')),
    permissoes_especiais TEXT,
    FOREIGN KEY (id_perfil) REFERENCES Perfil(id_perfil) ON DELETE CASCADE
);

-- ==============================
-- Tabela Telefones (Atributo Multivalorado de Usuário)
-- ==============================
CREATE TABLE Telefones (
    id_telefone SERIAL PRIMARY KEY,
    id_perfil INT NOT NULL,  
    telefone VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_perfil) REFERENCES Usuario(id_perfil) ON DELETE CASCADE
);

-- ==============================
-- Tabela Índice Econômico
-- ==============================
CREATE TABLE Indice_Economico (
    id_indice SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    descricao TEXT,
    unidade VARCHAR(20) NOT NULL
);

-- ==============================
-- Tabela Valor do Índice
-- ==============================
CREATE TABLE Valor_Indice (
    id_valor SERIAL PRIMARY KEY,
    id_indice INT NOT NULL,
    data_referencia DATE NOT NULL,
    valor NUMERIC(15,4) NOT NULL,
    FOREIGN KEY (id_indice) REFERENCES Indice_Economico(id_indice) ON DELETE CASCADE
);

-- ==============================
-- Tabela Relatório
-- ==============================
CREATE TABLE Relatorio (
    id_relatorio SERIAL PRIMARY KEY,
    id_perfil INT NOT NULL,
    filtros_aplicados TEXT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    formato VARCHAR(10) CHECK (formato IN ('CSV', 'PDF')),
    compactado BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_perfil) REFERENCES Usuario(id_perfil) ON DELETE CASCADE
);

-- ==============================
-- Tabela Histórico de Acesso
-- ==============================
CREATE TABLE Historico_Acesso (
    id_historico SERIAL PRIMARY KEY,
    id_perfil INT NOT NULL,
    acao TEXT NOT NULL,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_perfil) REFERENCES Usuario(id_perfil) ON DELETE CASCADE
);

-- ==============================
-- Tabela Notificações (Agora Com id_indice)
-- ==============================
CREATE TABLE Notificacao (
    id_notificacao SERIAL PRIMARY KEY,
    id_indice INT NOT NULL, 
    data_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    mensagem TEXT NOT NULL,
    status VARCHAR(20) CHECK (status IN ('enviada', 'lida', 'pendente')),
    FOREIGN KEY (id_indice) REFERENCES Indice_Economico(id_indice) ON DELETE CASCADE
);

-- ==============================
-- Tabela Destinatários de Notificações (Atributo Multivalorado)
-- ==============================
CREATE TABLE Destinatarios_Notificacao (
    id_destinatario SERIAL PRIMARY KEY,
    id_notificacao INT NOT NULL,
    id_perfil INT NOT NULL,
    FOREIGN KEY (id_notificacao) REFERENCES Notificacao(id_notificacao) ON DELETE CASCADE,
    FOREIGN KEY (id_perfil) REFERENCES Usuario(id_perfil) ON DELETE CASCADE
);
