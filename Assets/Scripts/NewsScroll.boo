import UnityEngine
import UnityEngine.UI
import Area

public class NewsScroll (MonoBehaviour): 
	news = []
	textbox as Text = null
	parent as Image = null
	initx = 0
	public newsmenu as NewsMenuPopulate

	randomnews as (News) = (
News("Colabonews","O Imposto sobre Partipação Política foi revogado. Todos os produtos devem ficar mais baratos.",Modifier("all",12,8)),
News("Colabonews","Prefeitura aumenta a fiscalização contra agrotóxicos usados irregularmente",Modifier("agropecuaria",5,1)),
News("Colabonews","Prefeitura vai ajudar na reconstrução de usina elétrica que explodiu há dois dias.",Modifier("infraestrutura",5,1)),
News("Colabonews","A câmara dos vereadores aprovou lei da Tarifa Zero em todos os teatros e cinemas da cidade.",Modifier("cultura",5,8)),
News("Colabonews","O crime organizado está tomando conta da cidade. Precisamos fortalecer a guerra contra as drogas",Modifier("seguranca",5,4)),
News("Colabonews","Todos os alunos de escola pública agora terão tablets de última geração",Modifier("educacao",5,8)),
News("Colabonews","As torcidas organizadas foram às ruas e conseguiram financiamento público para seus times",Modifier("esporte",5,8)),
News("Colabonews","O povo foi às ruas de novo pedindo por mais áreas verdes e os políticos atenderam",Modifier("meioambiente",5,8)),
News("Colabonews","Epidemia de vírus novo requer que remédios sejam importados.",Modifier("saude",5,5)),
News("Colabonews","A prefeitura deu início a novo programa de capacitação empreendedora.",Modifier("trabalho",5,4)),
News("Colabonews","Camara dos Vereadores aprovou Tarifa Zero no transporte público",Modifier("mobilidade",5,8)),
News("Colabonews","Deputado destina emenda parlamentar para o setor agropecuário municipal",Modifier("agropecuaria",-5,2)),
News("Colabonews","População mais consciente produz menos lixo. A prefeitura economiza em ações de saneamento público",Modifier("infraestrutura",-5,8)),
News("Colabonews","Mais da metade dos museus da cidade serão fechados para contenção de gastos",Modifier("cultura",-5,2)),
News("Colabonews","Nova licitação adquiriu câmeras pela metade do preço",Modifier("seguranca",-5,1)),
News("Colabonews","Parceria com ONG internacional garante acesso a material escolar para todos alunos da rede pública",Modifier("educacao",-5,8)),
News("Colabonews","Queda no preço do cimento facilitará a reforma nos estádios",Modifier("esporte",-5,2)),
News("Colabonews","A cidade lucrou milhões com a venda de créditos de carbono.",Modifier("meioambiente",-5,2)),
News("Colabonews","Centenas de médicos irregulares foram demitidos do sistema público de saúde.",Modifier("saude",-5,8)),
News("Colabonews","Software Livre implatado na secretaria de Trabalho reduz os custos com licenciamento de software",Modifier("trabalho",-5,8)),
News("Colabonews","Deputada destinou emenda parlamentar para melhoria da mobilidade urbana",Modifier("mobilidade",-5,2)),
//News("Colabonews","Cidade da região metropolitana solicita ajuda de custos da capital do estado",Modifier("orcamento",-8,2)),
News("Colabonews","A guerra civil no leste europeu desencadeou uma nova Crise Econômica Mundial.",Modifier("all",6,3)),
//News("Citiz3n","Você foi hackeado! Não fará investimento nenhum! Leia o http://colabonacao.com.br de novo.",Modifier("orcamento",-100,1)),
News("Citiz3n","Você leu o manifesto em http://colabonacao.com.br ? Sabia que tá fazendo muita coisa errada?",Modifier()),
News("Citiz3n","A representação política é falha! Por que vocês ainda permitem que os parlamentares ocupem o congresso?",Modifier()),
News("Citiz3n","Você realmente acha que tem algum poder de decisão? http://colabonacao.com.br",Modifier()),
News("Citiz3n","Leia novamente o manifesto http://colabonacao.com.br e relembre os princípios da nova política",Modifier()),
News("Citiz3n","Convide seus amigos a ler o manifesto http://colabonacao.com.br e manter sempre em mente os princípios da nova política",Modifier()),
News("Citiz3n","Eu tenho uma proposta: que tal distribuirmos o poder legislativo entre o povo? Comente em http://colabonacao.com.br",Modifier()),
News("Barbara","Cidadão, estamos sofrendo ataques cibernéticos em nosso sistema, mas logo corrigiremos isso.",Modifier()),
News("Barbara","O manifesto http://colabonacao.com.br nos fez abrir os olhos. Leia de novo e com frequência",Modifier()),
News("Barbara","Várias pessoas estão se reunindo em http://colabonacao.com.br para discutir a nova política. Participe!",Modifier()),
News("Barbara","A Colabonação está servindo de exemplo em outros países. Continue o bom trabalho.",Modifier()),
News("Barbara","Convide seus amigos a instalar Colabonação. Quanto mais pessoas participando, melhor!",Modifier()),
News("Barbara","Estamos mudando o país! Estamos fazendo história! Continue participando da Colabonação",Modifier()),
News("Barbara","Estamos rastreando quem é o cracker que tenta prejudicar nosso sistema. Lhe manteremos informado.",Modifier()),
News("Barbara","Uma boa política se faz com diálogo. Participe das discussões em http://colabonacao.com.br",Modifier()),
News("Diário do País","83,40% da população brasileira aprova o novo modelo político do Brasil",Modifier()),
News("Nação em Foco","Países da América do Sul enviam delegação de representantes à Brasília para conhecer o modelo Colabonação",Modifier()),
News("Diário do País","Manifestações de junho de 2013 já entraram nos livros de história das escolas",Modifier()),
News("Nação em Foco","Colabonação será tema de escola de samba no próximo carnaval",Modifier()),
News("Diário do País","Pesquisa de energias renováveis recebe investimentos internacionais",Modifier()),
News("Nação em Foco","Investigações de corrupção no poder legislativo estão suspensas",Modifier()),
News("Diário do País","Nova placa de energia solar mais barata é inventada no Brasil",Modifier()),
News("Nação em Foco","Cientistas inventam chocolate que não engorda",Modifier()),
News("Diário do País","Jovem de 14 anos bate o recorde de horas jogando jogos de celular",Modifier()),
News("Nação em Foco","Dupla sertaneja faz turnê em várias cidades brasileiras",Modifier()),
News("Diário do País","Banda de forró lança novo disco através da internet",Modifier()),
News("Nação em Foco","Autor de história em quadrinhos nacional é premiado na Europa.",Modifier()),
News("Diário do País","Pizza de 40 sabores é inventada no interior de São Paulo",Modifier()),
News("Nação em Foco","Nova minissérie na TV contará história de Napoleão Bonaparte",Modifier()),
News("Diário do País","Pessoas dizem ter encontrado alienígenas no Pantanal",Modifier()),
News("Nação em Foco","Fósseis de dinossauros encontrados no litoral norte do país",Modifier()),
News("Diário do País","Artista revelação do rap nacional reiventa a bossa nova",Modifier()),
News("Nação em Foco","Astronauta brasileiro vai passar 6 meses na estação espacial internacional",Modifier()),
News("Diário do País","Comédias stand-up fazem sucesso novamente em todos os estados brasileiros",Modifier()),
News("Nação em Foco","Empresa brasileira lança aplicativo de pedir pizza pelo celular em qualquer lugar do brasil",Modifier()),
News("Diário do País","Restaurante mais antigo do Brasil fecha as portas depois de 190 anos de atividades",Modifier()),
News("Nação em Foco","Celebridade descobre que têm câncer",Modifier()),
News("Diário do País","Terremoto atinge 4 cidades na Ásia",Modifier()),
News("Nação em Foco","Estados Unidos convocam presidente do Brasil para reunião",Modifier()),
News("Diário do País","Organização das Nações Unidas parabenizam a iniciativa da Colabonação",Modifier()),
News("Nação em Foco","Vulcão explode no sul do Chile e assusta moradores de cidade próxima",Modifier()),
News("Diário do País","Menino de 8 anos cria um jogo e vira o mais novo milionário do Brasil",Modifier()),
News("Nação em Foco","Foi criado um buraco negro dentro de laboratório brasileiro.",Modifier()),
News("Diário do País","Descobertos novos vestígios das primeiras civilizações humanas na África",Modifier()),
News("Nação em Foco","China declara publicamente que acredita que a experiência da Colabonação não vai dar certo",Modifier()),
News("Diário do País","Supostamente hackers estão tentando derrubar o sistema da Colabonação",Modifier()),
News("Nação em Foco","Falhas no sistema da Colabonação são o alvo de ataques cibernéticos",Modifier()),
News("Diário do País","Ainda não se conhece a origem dos ataques ao sistema da Colabonação",Modifier()),
News("Nação em Foco","ONU diz que a experiência brasileira da Colabonação deve ser respeitada e estudada.",Modifier()),
News("Diário do País","Avião desaparece sobrevoando a floresta amazônica",Modifier()),
News("Nação em Foco","Ator de novela sofre um acidente de carro",Modifier()),
News("Diário do País","Série de livros sobre herói adolescente está na lista dos mais vendidos do mundo",Modifier()),
News("Nação em Foco","Vaza na internet gravações que provam a infiltração de grupos políticos para tentar desfazer as manifestações",Modifier()),
News("Diário do País","Número de imigrações reduz no Brasil",Modifier()),
News("Nação em Foco","Virada Cultural reúne milhões de pessoas em festival de música",Modifier()),
News("Diário do País","Um bebê foi encontrado dentro de uma lixeira e adotado por um casal",Modifier()),
News("Nação em Foco","Internacional: Tsunami destrói centenas de casas no Japão",Modifier()),
News("Diário do País","Modelo com perna biônica é destaque na Fashion Week",Modifier()),
News("Nação em Foco","Garoto de 19 anos é a grande nova sensação do futebol brasileiro",Modifier()),
News("Diário do País","Brasil ganha o 2º lugar em campeanato internacional de natação",Modifier()),
News("Nação em Foco","Prédio mais alto do Brasil foi inaugurado com 90 andares",Modifier()),
News("Diário do País","Universidade brasileira conduz pesquisa genética para reduzir a obesidade.",Modifier()),
News("Nação em Foco","Brasil lança satélite de fabricação inteiramente nacional",Modifier()),
News("Diário do País","Casais afirmam que novo chocolate caseiro acabou com as brigas dentro de casa",Modifier()),
News("Nação em Foco","Filho de atriz de cinema nasce e recebe festa luxuosa",Modifier()),
News("Diário do País","Diferentes sindicatos de classe vão às ruas para defender seus direitos.",Modifier()),
News("Nação em Foco","Brasileiros residentes no exterior voltam a ir às ruas carregando a bandeira da Colabonação",Modifier()),
News("Diário do País","Países europeus demonstram insatisfação com brasileiros em seus territórios",Modifier()),
News("Nação em Foco","Explosão em restaurante teve vítimas fatais",Modifier()),
News("Diário do País","Suspeita de terrorismo em explosão de restaurante",Modifier()),
News("Nação em Foco","Artista pop internacional reúne milhões de fãs em show no Brasil",Modifier()),
News("Diário do País","Descoberto novo planeta com características iguais as da Terra e possivelmente habitável.",Modifier()),
News("Nação em Foco","12 políticos foram presos após grave denúncia de corrupção",Modifier()),
News("Diário do País","Artista plástico faz intervenção urbana em diferentes cidades com a bandeira da Colabonação",Modifier()),
News("Nação em Foco","Movimento na internet pede revisão da Constituição Brasileira de 1988",Modifier()),
News("Diário do País","Sites de diferentes países da União Européia foram derrubados por ataques cibernéticos de origem não identificada.",Modifier()),
News("Nação em Foco","Fotos íntimas de atriz estrangeira vazam na internet",Modifier()),
News("Diário do País","Criança de menos de um ano arranca a cabeça de uma cobra com uma mordida",Modifier()),
News("Nação em Foco","Encontro de sustentabilidade reúne representante de 50 países",Modifier()),
News("Diário do País","Sonda em Marte descobre a existência de água no planeta vermelho",Modifier()),
News("Nação em Foco","Furacão atinge litoral oeste dos Estados Unidos",Modifier()),
News("Diário do País","Vencedora de reality show gasta 200 mil em cirurgias plásticas",Modifier()),
News("Nação em Foco","Descoberta vacina contra dengue!",Modifier()),
News("Diário do País","Site conduz enquete para escolher a artista mais cafona do ano.",Modifier()),
News("Nação em Foco","Brasileiro bate recorde olímpico de ginástica",Modifier()),
News("Diário do País","Apresentador de programa de TV declara que faz dieta do sorvete",Modifier()),
News("Nação em Foco","Brasil vence novamente o mundial de futsal",Modifier()),
News("Diário do País","Cachorro mais feio do mundo vira celebridade na internet",Modifier()),
News("Nação em Foco","Voluntários organizam sopão para moradores de rua",Modifier()),
News("Diário do País","Manifestações terminam em violência na África do Sul",Modifier()),
News("Nação em Foco","Milhares de feministas ocupam as ruas contra as violências de gênero.",Modifier()),
News("Diário do País","Parlamento inglês enviou grupo de especialistas ao Brasil para estudar a Colabonação",Modifier()),
News("Nação em Foco","Movimento Ocupe Wall Street volta a ganhar forças inspirados pelas manifestações brasileiras",Modifier()),
News("Diário do País","Ator de hollywood é preso ao participar de protestos violentos nos EUA",Modifier()),
News("Nação em Foco","Manifestação de estudantes no Canadá exige maior participação na política do país",Modifier()),
News("Diário do País","Onda de protestos pelo mundo se diz inspirada pelo exemplo brasileiro",Modifier()),
		)
	def Start ():
		fetchRandomNews()
	
	def Update ():
		if (transform.position.x + Camera.mainCamera.ScreenToWorldPoint(Vector3(textbox.preferredWidth+Screen.width/1.4,0,0)).x < 0):
			transform.position.x = initx
		
		transform.position.x -= 0.2*Time.deltaTime*Camera.mainCamera.orthographicSize
		
	def getNews() as List:
		return news
		
	def fetchRandomNews():
		oldnews = news
		news = []
		//keep the ones with modifiers
		for n as News in oldnews:
			if n.getModifier() != null:
				n.getModifier().duration--
				if n.getModifier().duration > 0:
					news.Push(n)
		
		nums = []
		//get 12 news at random
		for i in range(12):
			num = Random.Range(0,len(randomnews))
			while num in nums:
				num = Random.Range(0,len(randomnews))
			nums.Push(num)
		for i in nums:
			if randomnews[i] != null:
				news.Push(randomnews[i])
				randomnews[i] = null
			
		textbox = gameObject.GetComponentInChildren[of Text]()
		textbox.text = [(n as News).getText() for n in news].Join("                                                               ")
		initx = transform.position.x

		newsmenu.Populate()
		
public class News():
	source as string
	text as string
	modifier as Modifier = null
	def constructor(newssource,settext,setmodifier):
		source = newssource
		text = settext
		modifier = setmodifier
	
	def getText():
		return "$(source): $(text)"
		
	def getSourceSprite():
		return null
		
	def getModifier():
		return modifier
		
class Modifier():
	public investment as string
	public duration as int
	public mod as single
	
	def constructor():
		investment = ""
		mod = 0
		duration = 0
	
	def constructor(investmentmod as string,modvalue as single,durationvalue as int):
		investment = investmentmod
		mod = modvalue
		duration = durationvalue

			
		
		