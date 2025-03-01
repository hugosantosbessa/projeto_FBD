-- ==============================================
-- Inserção de dados na tabela Perfil (Superclasse)
-- ==============================================
INSERT INTO Perfil (nome, email, senha) VALUES
('João Silva', 'joao.silva@email.com', 'senha123'), -- id_perfil = 1
('Maria Oliveira', 'maria.oliveira@email.com', 'senha456'), -- id_perfil = 2
('Carlos Mendes', 'carlos.mendes@email.com', 'senha789'), -- id_perfil = 3
('Ana Souza', 'ana.souza@email.com', 'senhaabc'), -- id_perfil = 4
('Pedro Lima', 'pedro.lima@email.com', 'senha1234'), -- id_perfil = 5
('Fernanda Costa', 'fernanda.costa@email.com', 'senha5678'), -- id_perfil = 6
('Lucas Martins', 'lucas.martins@email.com', 'senha9012'), -- id_perfil = 7
('Juliana Rocha', 'juliana.rocha@email.com', 'senha3456'), -- id_perfil = 8
('Roberto Nunes', 'roberto.nunes@email.com', 'senha7890'), -- id_perfil = 9
('Camila Ferreira', 'camila.ferreira@email.com', 'senha0987'); -- id_perfil = 10

-- ==============================================
-- Inserção de dados na tabela Usuário (usando perfis 1 a 5)
-- ==============================================
INSERT INTO Usuario (id_perfil, idioma_preferido) VALUES
(1, 'Português'),
(2, 'Inglês'),
(3, 'Espanhol'),
(4, 'Francês'),
(5, 'Português');

-- ==============================================
-- Inserção de dados na tabela Administrador (usando perfis 6 a 10)
-- ==============================================
INSERT INTO Administrador (id_perfil, nivel_acesso, permissoes_especiais) VALUES
(6, 'super', 'Gerenciar usuários e relatórios'),
(7, 'moderador', 'Aprovar notificações'),
(8, 'super', 'Acesso completo ao sistema'),
(9, 'moderador', 'Gerenciar filtros de pesquisa'),
(10, 'super', 'Criar novos índices econômicos');

-- ==============================================
-- Inserção de dados na tabela Telefones (Multivalorado) - Apenas para Usuários!
-- ==============================================
INSERT INTO Telefones (id_perfil, telefone) VALUES
(1, '(11) 91234-5678'),
(1, '(11) 99876-5432'),
(2, '(21) 97654-3210'),
(3, '(31) 93456-7890'),
(4, '(41) 98765-4321'),
(5, '(51) 94567-8901'); -- Apenas IDs de usuários (1 a 5)



-- ==============================================
-- Inserção de dados na tabela Índice Econômico
-- ==============================================
INSERT INTO Indice_Economico (nome, descricao, unidade) VALUES
('Taxa Selic', 'Taxa básica de juros', '%'),
('Inflação IPCA', 'Índice Nacional de Preços ao Consumidor Amplo', '%'),
('Câmbio USD', 'Cotação do dólar americano', 'R$'),
('PIB', 'Produto Interno Bruto', 'R$ bilhões'),
('Taxa de Desemprego', 'Percentual da população desempregada', '%'),
('Índice Bovespa', 'Indicador do mercado financeiro', 'pontos'),
('Taxa de Crédito', 'Taxa média de juros para empréstimos', '%'),
('Índice de Poupança', 'Taxa de rendimento da poupança', '%'),
('Dívida Pública', 'Dívida do governo em relação ao PIB', '%'),
('Taxa de Juros Bancária', 'Taxa média de juros praticada pelos bancos', '%');

-- ==============================================
-- Inserção de dados na tabela Valor do Índice
-- ==============================================
INSERT INTO Valor_Indice (id_indice, data_referencia, valor) VALUES
(1, '2025-01-01', 10.50),
(2, '2025-01-01', 5.20),
(3, '2025-01-01', 4.95),
(4, '2025-01-01', 7000),
(5, '2025-01-01', 12.1),
(6, '2025-01-01', 130000),
(7, '2025-01-01', 25.75),
(8, '2025-01-01', 0.45),
(9, '2025-01-01', 85.0),
(10, '2025-01-01', 18.25);

-- ==============================================
-- Inserção de dados na tabela Relatório
-- ==============================================
INSERT INTO Relatorio (id_perfil, filtros_aplicados, data_criacao, formato, compactado) VALUES
(1, 'Taxa Selic, Últimos 6 meses', NOW(), 'CSV', FALSE),
(2, 'Inflação IPCA, Últimos 3 meses', NOW(), 'PDF', TRUE),
(3, 'Câmbio USD, Último ano', NOW(), 'CSV', FALSE),
(4, 'PIB, Últimos 5 anos', NOW(), 'PDF', FALSE),
(5, 'Taxa de Crédito, Últimos 12 meses', NOW(), 'CSV', TRUE),
(1, 'Índice Bovespa, Últimos 2 anos', NOW(), 'PDF', FALSE),
(2, 'Taxa de Juros Bancária, Últimos 10 anos', NOW(), 'CSV', FALSE),
(3, 'Dívida Pública, Últimos 15 anos', NOW(), 'PDF', TRUE),
(4, 'Índice de Poupança, Últimos 20 anos', NOW(), 'CSV', FALSE),
(5, 'Taxa de Desemprego, Últimos 30 anos', NOW(), 'PDF', FALSE);

-- ==============================================
-- Inserção de dados na tabela Histórico de Acesso
-- ==============================================
INSERT INTO Historico_Acesso (id_perfil, acao, data_hora) VALUES
(1, 'Consulta Taxa Selic', NOW()),
(2, 'Exportação Relatório IPCA', NOW()),
(3, 'Consulta Câmbio USD', NOW()),
(4, 'Alteração de Permissões', NOW()),
(5, 'Criação de Novo Índice', NOW());

-- ==============================================
-- Inserção de dados na tabela Notificações
-- ==============================================
INSERT INTO Notificacao (id_indice, data_envio, mensagem, status) VALUES
(1, NOW(), 'Atualização na Taxa Selic', 'enviada'),
(2, NOW(), 'Nova inflação registrada', 'pendente'),
(3, NOW(), 'Cotação do dólar modificada', 'lida'),
(4, NOW(), 'PIB atualizado', 'enviada'),
(5, NOW(), 'Nova Taxa de Desemprego', 'pendente'),
(6, NOW(), 'Bovespa alcança novo recorde', 'enviada'),
(7, NOW(), 'Taxa de Crédito ajustada', 'lida'),
(8, NOW(), 'Novo rendimento da poupança', 'pendente'),
(9, NOW(), 'Dívida Pública revisada', 'lida'),
(10, NOW(), 'Mudança na Taxa de Juros Bancária', 'enviada');

-- ==============================================
-- Inserção de dados na tabela Destinatários de Notificações
-- ==============================================
INSERT INTO Destinatarios_Notificacao (id_notificacao, id_perfil) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5);


-- ==============================================
-- Inserção de mais 10 perfis na tabela Perfil
-- ==============================================
INSERT INTO Perfil (nome, email, senha) VALUES
('Ricardo Alves', 'ricardo.alves@email.com', 'senha111'),
('Vanessa Lima', 'vanessa.lima@email.com', 'senha222'),
('Gabriel Souza', 'gabriel.souza@email.com', 'senha333'),
('Tatiane Borges', 'tatiane.borges@email.com', 'senha444'),
('Rodrigo Cunha', 'rodrigo.cunha@email.com', 'senha555'),
('Patrícia Nascimento', 'patricia.nascimento@email.com', 'senha666'),
('Fábio Teixeira', 'fabio.teixeira@email.com', 'senha777'),
('Elaine Mendes', 'elaine.mendes@email.com', 'senha888'),
('César Oliveira', 'cesar.oliveira@email.com', 'senha999'),
('Beatriz Campos', 'beatriz.campos@email.com', 'senha000');


INSERT INTO Usuario (id_perfil, idioma_preferido) VALUES
(11, 'Português'),
(12, 'Inglês'),
(13, 'Espanhol'),
(14, 'Francês'),
(15, 'Alemão');

INSERT INTO Administrador (id_perfil, nivel_acesso, permissoes_especiais) VALUES
(16, 'super', 'Controle total do sistema'),
(17, 'moderador', 'Aprovação de relatórios'),
(18, 'super', 'Gerenciamento de usuários'),
(19, 'moderador', 'Controle de notificações'),
(20, 'super', 'Gerenciamento de índices econômicos');

INSERT INTO Telefones (id_perfil, telefone) VALUES
(11, '(11) 92345-6789'),
(12, '(21) 98765-4321'),
(13, '(31) 93456-7890'),
(14, '(41) 94567-8901'),
(15, '(51) 95678-9012');

INSERT INTO Destinatarios_Notificacao (id_notificacao, id_perfil) VALUES
(6, 11), (7, 12), (8, 13), (9, 14), (10, 15);
