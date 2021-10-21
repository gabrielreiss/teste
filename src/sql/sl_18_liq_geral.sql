select t1.cod_ibge,
        t1.instituicao,
        CASE WHEN t1.valor IS NULL THEN 0 ELSE t1.valor END /
        (CASE WHEN t2.valor IS NULL THEN 0 ELSE t2.valor END +
        CASE WHEN t3.valor IS NULL THEN 0 ELSE t3.valor END) as 'valor'
from (
    select *
    from dca
    where cod_conta = 'P1.0.0.0.0.00.00'
) as t1

left join (
    select cod_ibge,
            valor
    from dca
    where cod_conta = 'P2.1.0.0.0.00.00'
) as t2
on t1.cod_ibge = t2.cod_ibge

left join (
    select cod_ibge,
            valor
    from dca
    where cod_conta = 'P2.2.0.0.0.00.00'
) as t3
on t1.cod_ibge = t3.cod_ibge
;