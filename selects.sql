-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
    SELECT
        pedidos.*,
        produtos.*
    FROM
        produtos 
    JOIN 
        produtos_pedidos ON produtos_pedidos.produto_id = produtos.id
    JOIN
    	pedidos ON pedidos.id = produtos_pedidos.pedido_id;

-- 2)
    SELECT
        pedido_id
    FROM
        produtos_pedidos
    JOIN
        produtos ON produtos.id = produtos_pedidos.produto_id AND produtos.nome = 'Fritas';

-- 3)
    SELECT
	    clientes.nome
    FROM
        clientes
    JOIN
        pedidos ON pedidos.cliente_id = clientes.id
	JOIN
    	produtos_pedidos ON produtos_pedidos.pedido_id = pedidos.id
    JOIN
        produtos ON produtos.id = produtos_pedidos.produto_id AND produtos.nome = 'Fritas';

-- 4)
    SELECT
    	SUM(produtos.preco)
    FROM
    	produtos
    JOIN
    	produtos_pedidos ON produtos_pedidos.produto_id = produtos.id
    JOIN
    	pedidos ON pedidos.id = produtos_pedidos.pedido_id
    JOIN
    	clientes ON clientes.id = pedidos.cliente_id AND clientes.nome = 'Laura';

-- 5)
    SELECT
		COUNT(produtos.id),
        produtos.nome
    FROM
    	produtos_pedidos
    JOIN
    	produtos ON produtos_pedidos.produto_id = produtos.id GROUP BY (produtos.nome);
