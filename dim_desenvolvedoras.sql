
-- Configuração de materialização: vamos criar como uma tabela física.
{{config(materialized = 'table')}}

WITH stg_kaggle_survey_2022_mulheres_dados AS (
    SELECT * FROM {{ref('stg_kaggle_survey_2022_mulheres_dados')}}
),
stg_paises AS (
    SELECT * FROM {{ref('stg_paises')}}
)

SELECT stg_kaggle_survey_2022_mulheres_dados.PAIS,
       stg_paises.CODIGO_PAIS,
       stg_paises.REGIAO,
       stg_kaggle_survey_2022_mulheres_dados.NIVEL_EDUCACIONAL,
       stg_kaggle_survey_2022_mulheres_dados.ANOS_PROGRAMANDO,
       stg_kaggle_survey_2022_mulheres_dados.CARGO_ATUAL,
       stg_kaggle_survey_2022_mulheres_dados.ANOS_USANDO_ML,
       stg_kaggle_survey_2022_mulheres_dados.SALARIO_ANUAL_USD,
       stg_kaggle_survey_2022_mulheres_dados.LINGUAGENS_USADAS,
       stg_kaggle_survey_2022_mulheres_dados.BANCOS_DE_DADOS_USADOS,
       stg_kaggle_survey_2022_mulheres_dados.FERRAMENTAS_BI_USADAS
FROM stg_kaggle_survey_2022_mulheres_dados
   LEFT JOIN stg_paises ON stg_kaggle_survey_2022_mulheres_dados.PAIS = stg_paises.NOME_PAIS
