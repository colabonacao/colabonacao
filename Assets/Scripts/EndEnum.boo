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
		
	public endingsText as (string) = ("- A cidade é exemplo mundial de democracia direta.\n", "- Os cidadãos conseguiram se organizar pelo bem da cidade. A Colabonação prospera.\n", "- A cidade está se equilibrando. Continue nesse caminho que iremos prosperar.\n", "- Ocupações ilegais de terras públicas aumentam e preocupam moradores\n", "- Abastecimento de alimentos da cidade não é suficiente e a população vive crise de fome\n", "- Músicos protestam com batucada nas ruas pedindo mais recursos para a Cultura\n", "- Bibliotecas fecham as portas por falta de investimento\n", "- Professores sem salários fazem greve\n", "- Escolas abandonadas são ocupadas por gangues\n", "- Torcidas organizadas fazem protesto que termina em briga nas ruas\n", "- Clubes esportivos deixam de existir. Estadios só servem para shows musicais\n", "- Apagões são cada vez mais frequentes na cidade\n", "- Com muito lixo nas ruas a cidade sofre com alagamentos e risco de doenças aumenta\n", "- Árvores apodrecem por falta de cuidados e caem com frequência\n", "- Sem áreas verdes, a poluição é absoluta e as doenças pulmonares constantes\n", "- Sinalização ruim aumenta o número de acidentes de trânsito\n", "- Sem fiscalização de trânsito, é cada dia mais perigoso sair de casa e sofrer um acidente.\n", "- O principal hospital da cidade fecha por não conseguir contratar médicos\n", "- Epidemia de dengue mata 10 por semana\n", "- Quantidade de latrocínios aumenta na cidade\n", "- Cidadãos decidem fazer justiça com as próprias mãos na ausência da polícia\n", "- Desemprego aumenta e a população fica infeliz e preocupada\n", "- Crise econômica piora. Quantidade de suicídios é assustadora\n")
	