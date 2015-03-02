import UnityEngine
import UnityEngine.UI
import Area

public class NewsScroll (MonoBehaviour): 
	news = []
	textbox as Text = null
	parent as Image = null
	initx = 0

	def Start ():
		randomnews = [
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
//News("Colabonews","Você foi hackeado! Não fará investimento nenhum! Leia o http://colabonacao.com.br de novo.",Modifier("orcamento",-100,1)),
News("Colabonews","Você leu o manifesto em http://colabonacao.com.br ? Sabia que tá fazendo muita coisa errada?",Modifier()),
News("Colabonews","A representação política é falha! Por que vocês ainda permitem que os parlamentares ocupem o congresso?",Modifier()),
News("Colabonews","Você realmente acha que tem algum poder de decisão? http://colabonacao.com.br",Modifier()),
News("Colabonews","Leia novamente o manifesto http://colabonacao.com.br e relembre os princípios da nova política",Modifier()),
News("Colabonews","Convide seus amigos a ler o manifesto http://colabonacao.com.br e manter sempre em mente os princípios da nova política",Modifier()),
News("Colabonews","Eu tenho uma proposta: que tal distribuirmos o poder legislativo entre o povo? Comente em http://colabonacao.com.br",Modifier()),
News("Colabonews","Cidadão, estamos sofrendo ataques cibernéticos em nosso sistema, mas logo corrigiremos isso.",Modifier()),
News("Colabonews","O manifesto http://colabonacao.com.br nos fez abrir os olhos. Leia de novo e com frequência",Modifier()),
News("Colabonews","Várias pessoas estão se reunindo em http://colabonacao.com.br para discutir a nova política. Participe!",Modifier()),
News("Colabonews","A Colabonação está servindo de exemplo em outros países. Continue o bom trabalho.",Modifier()),
News("Colabonews","Convide seus amigos a instalar Colabonação. Quanto mais pessoas participando, melhor!",Modifier()),
News("Colabonews","Estamos mudando o país! Estamos fazendo história! Continue participando da Colabonação",Modifier()),
News("Colabonews","Estamos rastreando quem é o cracker que tenta prejudicar nosso sistema. Lhe manteremos informado.",Modifier()),
News("Colabonews","Uma boa política se faz com diálogo. Participe das discussões em http://colabonacao.com.br",Modifier()),
News("Colabonews","83,40% da população brasileira aprova o novo modelo político do Brasil",Modifier()),
News("Colabonews","Países da América do Sul enviam delegação de representantes à Brasília para conhecer o modelo Colabonação",Modifier()),
News("Colabonews","Manifestações de junho de 2013 já entraram nos livros de história das escolas",Modifier()),
News("Colabonews","Colabonação será tema de escola de samba no próximo carnaval",Modifier()),
News("Colabonews","Pesquisa de energias renováveis recebe investimentos internacionais",Modifier()),
News("Colabonews","Investigações de corrupção no poder legislativo estão suspensas",Modifier()),
News("Colabonews","Nova placa de energia solar mais barata é inventada no Brasil",Modifier()),
News("Colabonews","Cientistas inventam chocolate que não engorda",Modifier()),
News("Colabonews","Jovem de 14 anos bate o recorde de horas jogando jogos de celular",Modifier()),
News("Colabonews","Dupla sertaneja faz turnê em várias cidades brasileiras",Modifier()),
News("Colabonews","Banda de forró lança novo disco através da internet",Modifier()),
News("Colabonews","Autor de história em quadrinhos nacional é premiado na Europa.",Modifier()),
News("Colabonews","Pizza de 40 sabores é inventada no interior de São Paulo",Modifier()),
News("Colabonews","Nova minissérie na TV contará história de Napoleão Bonaparte",Modifier()),
News("Colabonews","Pessoas dizem ter encontrado alienígenas no Pantanal",Modifier()),
News("Colabonews","Fósseis de dinossauros encontrados no litoral norte do país",Modifier()),
News("Colabonews","Artista revelação do rap nacional reiventa a bossa nova",Modifier()),
News("Colabonews","Astronauta brasileiro vai passar 6 meses na estação espacial internacional",Modifier()),
News("Colabonews","Comédias stand-up fazem sucesso novamente em todos os estados brasileiros",Modifier()),
News("Colabonews","Empresa brasileira lança aplicativo de pedir pizza pelo celular em qualquer lugar do brasil",Modifier()),
News("Colabonews","Restaurante mais antigo do Brasil fecha as portas depois de 190 anos de atividades",Modifier()),
News("Colabonews","Celebridade descobre que têm câncer",Modifier()),
News("Colabonews","Terremoto atinge 4 cidades na Ásia",Modifier()),
News("Colabonews","Estados Unidos convocam presidente do Brasil para reunião",Modifier()),
News("Colabonews","Organização das Nações Unidas parabenizam a iniciativa da Colabonação",Modifier()),
News("Colabonews","Vulcão explode no sul do Chile e assusta moradores de cidade próxima",Modifier()),
News("Colabonews","Menino de 8 anos cria um jogo e vira o mais novo milionário do Brasil",Modifier()),
News("Colabonews","Foi criado um buraco negro dentro de laboratório brasileiro.",Modifier()),
News("Colabonews","Descobertos novos vestígios das primeiras civilizações humanas na África",Modifier()),
News("Colabonews","China declara publicamente que acredita que a experiência da Colabonação não vai dar certo",Modifier()),
News("Colabonews","Supostamente hackers estão tentando derrubar o sistema da Colabonação",Modifier()),
News("Colabonews","Falhas no sistema da Colabonação são o alvo de ataques cibernéticos",Modifier()),
News("Colabonews","Ainda não se conhece a origem dos ataques ao sistema da Colabonação",Modifier()),
News("Colabonews","ONU diz que a experiência brasileira da Colabonação deve ser respeitada e estudada.",Modifier()),
News("Colabonews","Avião desaparece sobrevoando a floresta amazônica",Modifier()),
News("Colabonews","Ator de novela sofre um acidente de carro",Modifier()),
News("Colabonews","Série de livros sobre herói adolescente está na lista dos mais vendidos do mundo",Modifier()),
News("Colabonews","Vaza na internet gravações que provam a infiltração de grupos políticos para tentar desfazer as manifestações",Modifier()),
News("Colabonews","Número de imigrações reduz no Brasil",Modifier()),
News("Colabonews","Virada Cultural reúne milhões de pessoas em festival de música",Modifier()),
News("Colabonews","Um bebê foi encontrado dentro de uma lixeira e adotado por um casal",Modifier()),
News("Colabonews","Internacional: Tsunami destrói centenas de casas no Japão",Modifier()),
News("Colabonews","Modelo com perna biônica é destaque na Fashion Week",Modifier()),
News("Colabonews","Garoto de 19 anos é a grande nova sensação do futebol brasileiro",Modifier()),
News("Colabonews","Brasil ganha o 2º lugar em campeanato internacional de natação",Modifier()),
News("Colabonews","Prédio mais alto do Brasil foi inaugurado com 90 andares",Modifier()),
News("Colabonews","Universidade brasileira conduz pesquisa genética para reduzir a obesidade.",Modifier()),
News("Colabonews","Brasil lança satélite de fabricação inteiramente nacional",Modifier()),
News("Colabonews","Casais afirmam que novo chocolate caseiro acabou com as brigas dentro de casa",Modifier()),
News("Colabonews","Filho de atriz de cinema nasce e recebe festa luxuosa",Modifier()),
News("Colabonews","Diferentes sindicatos de classe vão às ruas para defender seus direitos.",Modifier()),
News("Colabonews","Brasileiros residentes no exterior voltam a ir às ruas carregando a bandeira da Colabonação",Modifier()),
News("Colabonews","Países europeus demonstram insatisfação com brasileiros em seus territórios",Modifier()),
News("Colabonews","Explosão em restaurante teve vítimas fatais",Modifier()),
News("Colabonews","Suspeita de terrorismo em explosão de restaurante",Modifier()),
News("Colabonews","Artista pop internacional reúne milhões de fãs em show no Brasil",Modifier()),
News("Colabonews","Descoberto novo planeta com características iguais as da Terra e possivelmente habitável.",Modifier()),
News("Colabonews","12 políticos foram presos após grave denúncia de corrupção",Modifier()),
News("Colabonews","Artista plástico faz intervenção urbana em diferentes cidades com a bandeira da Colabonação",Modifier()),
News("Colabonews","Movimento na internet pede revisão da Constituição Brasileira de 1988",Modifier()),
News("Colabonews","Sites de diferentes países da União Européia foram derrubados por ataques cibernéticos de origem não identificada.",Modifier()),
News("Colabonews","Fotos íntimas de atriz estrangeira vazam na internet",Modifier()),
News("Colabonews","Criança de menos de um ano arranca a cabeça de uma cobra com uma mordida",Modifier()),
News("Colabonews","Encontro de sustentabilidade reúne representante de 50 países",Modifier()),
News("Colabonews","Sonda em Marte descobre a existência de água no planeta vermelho",Modifier()),
News("Colabonews","Furacão atinge litoral oeste dos Estados Unidos",Modifier()),
News("Colabonews","Vencedora de reality show gasta 200 mil em cirurgias plásticas",Modifier()),
News("Colabonews","Descoberta vacina contra dengue!",Modifier()),
News("Colabonews","Site conduz enquete para escolher a artista mais cafona do ano.",Modifier()),
News("Colabonews","Brasileiro bate recorde olímpico de ginástica",Modifier()),
News("Colabonews","Apresentador de programa de TV declara que faz dieta do sorvete",Modifier()),
News("Colabonews","Brasil vence novamente o mundial de futsal",Modifier()),
News("Colabonews","Cachorro mais feio do mundo vira celebridade na internet",Modifier()),
News("Colabonews","Voluntários organizam sopão para moradores de rua",Modifier()),
News("Colabonews","Manifestações terminam em violência na África do Sul",Modifier()),
News("Colabonews","Milhares de feministas ocupam as ruas contra as violências de gênero.",Modifier()),
News("Colabonews","Parlamento inglês enviou grupo de especialistas ao Brasil para estudar a Colabonação",Modifier()),
News("Colabonews","Movimento Ocupe Wall Street volta a ganhar forças inspirados pelas manifestações brasileiras",Modifier()),
News("Colabonews","Ator de hollywood é preso ao participar de protestos violentos nos EUA",Modifier()),
News("Colabonews","Manifestação de estudantes no Canadá exige maior participação na política do país",Modifier()),
News("Colabonews","Onda de protestos pelo mundo se diz inspirada pelo exemplo brasileiro",Modifier()),
		]
		
		nums = []
		
		//get 3 news at random
		for i in range(3):
			num = Random.Range(0,len(randomnews))
			while num in nums:
				num = Random.Range(0,len(randomnews))
			nums.Push(num)
		for i in nums:
			news.Push(randomnews[i])

		textbox = gameObject.GetComponentInChildren[of Text]()
		textbox.text = [(n as News).getText() for n in news].Join("                                                               ")
		initx = transform.position.x
	
	def Update ():
		if (transform.position.x + Camera.mainCamera.ScreenToWorldPoint(Vector3(textbox.preferredWidth+Screen.width/1.4,0,0)).x < 0):
			transform.position.x = initx
		
		transform.position.x -= 0.2*Time.deltaTime*Camera.mainCamera.orthographicSize
		
	def getNews():
		return news

public class News():
	source as string
	text as string
	modifier as Modifier
	def constructor(newssource,settext,setmodifier):
		source = newssource
		text = settext
		modifier = setmodifier
	
	def getText():
		return "$(source): $(text)"
		
	def getSourceSprite():
		return null
		
class Modifier():
	investment as string
	duration as int
	mod as single
	
	def constructor():
		investment = ""
		mod = 0
		duration = 0
	
	def constructor(investmentmod as string,modvalue as single,durationvalue as int):
		investment = investmentmod
		mod = modvalue
		duration = durationvalue

			
		
		