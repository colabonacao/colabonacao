import UnityEngine

class EndEnum (MonoBehaviour): 

	public enum Endings:
		SuccessComplete
		SuccessModerate
		SuccessSmall
		FailAgro
		CriticalFailAgro
		FailCult
		CriticalFailCult
		FailEdu
		CriticalFailEdu
		FailEsp
		CriticalFailEsp
		FailInfra
		CriticalFailInfra
		FailMeio
		CriticalFailMeio
		FailMobi
		CriticalFailMobi
		FailSaude
		CriticalFailSaude
		FailSeg
		CriticalFailSeg
		FailTrab
		CriticalFailTrab
		
	public endingsText as (string) = ("A cidade é exemplo mundial de democracia direta.", "Os cidadãos conseguiram se organizar pelo bem da cidade. A Colabonação prospera.", "A cidade está se equilibrando. Continue nesse caminho que iremos prosperar.", "Ocupações ilegais de terras públicas aumentam e preocupam moradores", "Abastecimento de alimentos da cidade não é suficiente e a população vive crise de fome", "Músicos protestam com batucada nas ruas pedindo mais recursos para a Cultura", "Bibliotecas fecham as portas por falta de investimento", "Professores sem salários fazem greve", "Escolas abandonadas são ocupadas por gangues", "Torcidas organizadas fazem protesto que termina em briga nas ruas", "Clubes esportivos deixam de existir. Estadios só servem para shows musicais", "Apagões são cada vez mais frequentes na cidade", "Com muito lixo nas ruas a cidade sofre com alagamentos e risco de doenças aumenta", "Árvores apodrecem por falta de cuidados e caem com frequência", "Sem áreas verdes, a poluição é absoluta e as doenças pulmonares constantes", "Sinalização ruim aumenta o número de acidentes de trânsito", "Sem fiscalização de trânsito, é cada dia mais perigoso sair de casa e sofrer um acidente.", "O principal hospital da cidade fecha por não conseguir contratar médicos", "Epidemia de dengue mata 10 por semana", "Quantidade de latrocínios aumenta na cidade", "Cidadãos decidem fazer justiça com as próprias mãos na ausência da polícia", "Desemprego aumenta e a população fica infeliz e preocupada", "Crise econômica piora. Quantidade de suicídios é assustadora")
	