<!doctype html>
<html lang="en">
<head>
<title>Assistant</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="CSS/style.css">
<link rel="stylesheet" href="CSS/Shop.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"
	integrity="sha384-u/bQvRA/1bobcXlcEYpsEdFVK/vJs3+T+nXLsBYJthmdBuavHvAW6UsmqO2Gd/F9"
	crossorigin="anonymous"></script>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">

<style>
.checked {
	color: orange;
}

.container {
	padding: 2rem 0rem;
}

.table-image {td , th { vertical-align:middle;
	
}
}
</style>
<%@page import="java.util.*" %>
<%@page import="java.io.IOException" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="com.mysql.jdbc.Connection" %>
<%@page import="com.mysql.jdbc.PreparedStatement" %>
<body>

	<div class="wrapper d-flex align-items-stretch">
		<nav id="sidebar">
			<div class="custom-menu">
				<button type="button" id="sidebarCollapse" class="btn btn-primary">
				</button>
			</div>
			<div class="img bg-wrap text-center py-4"
				style="background-image: url(images/bg_1.jpg);">
				<div class="user-logo">
					<label for="file" class="img"><img id="profile"
						style="border-radius: 50%" height="100" width="100"
						src="images/logo.jpg"></label> <input style="display: none"
						id="file" type="file" onchange="loadFile(event)" />
					<h3><%HttpSession ses=request.getSession();
					String number=String.valueOf(ses.getAttribute("pno"));
					if(ses.getAttribute("pno")!=null)
					{
						
						//System.out.println(number);
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerzone", "Bootathon","6383411123");
		PreparedStatement st=(PreparedStatement) con.prepareStatement("select * from consumerregister where `Phonenumber` = ?");
		st.setString(1,number);
		String dbfname="";
		String dbflastname="";
		String loc="";
		 ResultSet r1=st.executeQuery(); 
		 while(r1.next())
		 {
			 
			 dbfname=r1.getString("Firstname");
			// out.println(dbuser);
			 dbflastname=r1.getString("Lastname");
			 loc=r1.getString("Location");
		 }
		 HttpSession s=request.getSession();
		 s.setAttribute("consloc", loc);
		 //System.out.println(loc);
		out.println(dbfname);
		out.println(dbflastname);
		con.close();
	}
	catch(Exception ec)
	{
		System.out.print(ec);
	}
					}
					else
					{
						request.setAttribute("Loginauthcon", "Please Login as Consumer first..");
						 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Login.jsp");
						 dispatcher.forward(request, response);
					} %></h3>
				</div>
			</div>
			<!-- span class="fa fa-download mr-3 notif"><small
							class="d-flex align-items-center justify-content-center">5</small></span> -->
			<ul class="list-unstyled components mb-5">
				<li><a href="FarmerDashboard.jsp"><span
						class="fa fa-home mr-3"></span> Home</a></li>
				<li><a href="ContactsStore"><span id="messageSpan"
						class="fa fa-mobile mr-3"><small id="messaged"
							class="d-flex align-items-center justify-content-center"></small></span>
						Contacts</a></li>
				<li><a href="Shop.jsp"><span class="fa fa-store-alt mr-3"></span>
						Shop</a></li>
				<li><a href="Orders.jsp"><span class="fa fa-cart-plus mr-3"></span>
						Orders</a></li>

				<li class="active"><a href="Assistant.jsp"><span
						class="fas fa-users mr-3"></span> Assistant</a></li>

				<li><a href="Statistics.jsp"><span
						class="fa fa-line-chart mr-3"></span> Stats and History</a></li>
				<li><a href="Settings.jsp"><span class="fa fa-cog mr-3"></span>
						Settings</a></li>
				<li><a href="logout.jsp"><span
						class="fa fa-sign-out-alt mr-3"></span> Sign Out</a></li>
			</ul>

		</nav>

		<!-- Page Content  -->
		<div id="content" class="p-4 p-md-5 pt-5">
			<div class="get-quote">
				<div class="row">
					<div class="col-sm-8 col-12">
						<h3 id="quote">Assistant</h3>
					</div>
					<div class="col-sm-4 col-12">
						<div id="google_translate_element">
							<b>Click Here to Translate the page</b>
						</div>
					</div>
				</div>
			</div>
			<hr></hr>

			<div id="results" class="container">
				<h1>
					<b>Cropping seasons of TamilNadu</b>
				</h1>
				<p>The cultivated area of the state is 4.7 million , comprising
					36% of the total geographical area. The irrigated area covering
					2.15 million ha is 46% of the cultivated area. The cropping
					intensity is around 113%. The red and black soils are deficient in
					nitrogen, phosphorus and zinc.</p>
				<p>The major crops are rice, cotton, groundnut, mungbean,
					urdbean and sugarcane. Groundwater availability is poor due to
					non-aquiferous rocky terrain. Suggested interventions for natural
					resource management for agriculture in the state are as follows:</p>
				<ul>
					<li>Site-specific nutrient management on 0.5 million ha of
						rice-rice system to produce additional 1.2 million tonnes of
						rice/annum.</li>
					<li>Integrated household farming system (rice + fish +
						duckery) to increase the income by Rs 10,000.</li>
					<li>Watershed management including water harvesting in village
						ponds/tanks.</li>
				</ul>
				<h2 style="color: rgba(255, 0, 0, 0.5);">
					<b>Soil Types And Suitable Crops</b>
				</h2>
				<p>
					<b>Introduction to Soil Types:-</b> The following information is
					all about soils and their types in India. It also explains about
					suitable crops for different soil types as well as areas of these
					soils.
				</p>
				<p>
					<b>What is Soil:</b>A soil can be defined as outermost layer of
					earths crust which plays major role in growing food and trees. It
					contains organisms and also consists minerals, organic matter
					(humus), water, gases and air.
				</p>
				<p>
					<b>Soil Formation:</b>How the soil formed? well, soil formation is
					a very long process and actually begins with the weathering of
					rocks into small fragments. The origin of soil is from rocks
					(parent material), usually formed when rocks are exposed to the
					atmosphere in the process of physical and chemical decomposition.
					Parent material (usually rocks) and the process of soil formation
					decide the soil properties. The soils in India are divided into 2
					broad categories based on their formation.
				</p>
				<ol>
					<li>Residual Soils</li>
					<li>Transported Soils</li>
				</ol>
				<p>
					<b>Soil Types and Factors that Determines (Affect) Soil
						Formation:</b> There are some factors that determine the types of soil
					found in India.
				</p>
				<ol>
					<li>Topography.</li>
					<li>Climate.</li>
					<li>Parent materials (usually rocks).</li>
					<li>Organisms.</li>
					<li>Time.</li>
				</ol>
				<p>
					<b>Soil Types ,Soil Profile and Horizon:</b> As we know soils are
					made of layers which is also called â€œHorizonsâ€. These all
					layers (horizons) put together form a soil profile. Soil profile is
					indicates the complete history of soil formation and ingredients of
					it. In general, a soil profile consists of 6 horizons.
				</p>
				<img
					src=" https://www.agrifarming.in/wp-content/uploads/2017/09/Soil-Profile..jpg"></img>
				<p>
					<b>Soil Types and Soil Minerals: </b>The soil consists of primary
					and secondary minerals.
				</p>
				<p>
					1.Primary Minerals : Calcium, Sodium, Aluminium, Magnesium and
					Iron.<br> 2.Secondary Minerals : Clay and Mineral Oxides.
				</p>
				<p>
					<b>Soil Types and Functions of Soil:</b> Well, soil plays major
					role and has primary functions in earthâ€™s life.
				</p>
				<p>
					1.Soil works as medium for plant growth in the ecosystem.<br>
					2.Soil can able store, purify and supply the water to the needy.<br>
					3.Soil is considered as a modifier of Earths atmosphere (climate).<br>
					4.Soil has natural habitat and basis for life survival.
				</p>
				<iframe width="560" height="315"
					src="https://www.youtube.com/embed/vMkd4nKgGDk" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
				<p>
					<b>Soil Types in India:</b> There are many soil types exist in
					Indian continent. Each soil type has specific characteristics and
					suitable to grow only certain type of crop.
				</p>
				<h2>
					<b>1.Alluvial Soils:</b>
				</h2>
				<img
					src="https://www.agrifarming.in/wp-content/uploads/2017/09/Alluvial-Soil..png "></img>
				<ul>
					<li><b>Regions :</b> You can find Alluvial soils in most part
						of the delta regions of Northern India. These soil cover more than
						35% of the total land in India.<br></li>
					<li><b>Characteristics :</b> These soils are rich nutrients
						like phosphoric acid and organic matter (humus). However, they are
						poor in nitrogen and potash. Alluvial soils are mixture of clay
						and sand (loam). These soils are tend to be sandier and can quick
						draining properties than many other soils.<br></li>
					<li><b>Suitable Crops of Alluvial Soils :</b> Tobacco, cotton,
						rice, wheat, bajra, sorghum (jowar), pea, pigeon pea, chickpea,
						black gram, green gram, soybean, groundnut, mustard, linseed,
						sesame, barley, jute, maize, any oilseeds, vegetables and fruits
						are suitable in these soils under ideal irrigation.</li>
				</ul>
				<h2>
					<b>2.Black Soils:</b>
				</h2>
				<img
					src="https://www.agrifarming.in/wp-content/uploads/2017/09/Black-Soil..jpg "></img>
				<ul>
					<li><b>Regions: </b>Black soils are also called as Cotton
						soils or Regur Soils. These soils mainly found in Deccan lava
						tract which includes the states of Telangana, Andhra Pradesh,
						Maharashtra, Tamil Nadu, Madhya Pradesh and Gujarat. Mostly, you
						can find this type soils in the river valley Godavari, Krishna,
						Narmada, and Tapi. Black soils are formed due to the weathering of
						the lava rocks.</li>
					<li><b>Characteristics :</b> Black soils are rich in iron,
						lime, magnesium and aluminium. However, they are poor in
						phosphorus, nitrogen and humus (organic matter). Usually, this
						soil gets its black colour from various salts or from humus during
						the soil formation. Black soils contain a large amount of clay,
						but is sandy as well in hillier regions of the country. Black
						soils become sticky when wet and develop wide cracks during dry
						season.</li>
					<li><b>Suitable Crops of Black Soils :</b> The black soils
						moisture very well hence itâ€™s excellent for growing cotton. This
						is also popularly known as black cotton soil. However, there are
						many other crops which can be grown in these soils are; Rice and
						sugarcane, wheat, jowar, linseed, sunflower, cereal crops, citrus
						fruits, vegetables, tobacco, groundnut, any oilseed crops and
						millets.</li>
				</ul>
				<h2>
					<b>3.Red and Yellow Soils:</b>
				</h2>
				<img
					src="https://www.agrifarming.in/wp-content/uploads/2017/09/Red-Soil..jpg "></img>
				<ul>
					<li><b>Regions :</b> These soils are found in parts of
						Chhattisgarh, Deccan plateau, Orissa, and Western Ghats.</li>
					<li><b>Characteristics :</b> These soils are red in colour due
						the presence of iron oxide. These are formed due weathering of
						metamorphic rocks. These soils are sandy and somewhat acidic and
						rich in potash. However they are very poor in lime, nitrogen,
						phosphorous, magnesium, organic matter (humus).</li>
					<li><b>Suitable Crops of Red and Yellow Soils :</b> Rice,
						wheat, sugarcane, maize/corn, groundnut, ragi (finger millet) and
						potato, oil seeds, pulses, millets and fruits such as mango,
						orange, citrus, and vegetables can be grown under ideal
						irrigation.</li>
				</ul>
				<h2>
					<b>4.Laterite Soils:</b>
				</h2>
				<img
					src="https://www.agrifarming.in/wp-content/uploads/2017/09/Laterite-Soils..jpg "></img>
				<ul>
					<li><b>Regions :</b> Tamil Nadu, Karnataka, Kerala, Madhya
						Pradesh ,Orissa, and Assam</li>
					<li><b>Characteristics :</b> These soils acidic in nature and
						are poor in humus (organic matter), phosphate, nitrogen and
						calcium. Laterite soils are very rich in iron.</li>
					<li><b>Suitable Crops of Laterite Soils :</b> These soil are
						not very fertile and is used in cotton growing, rice cultivation,
						wheat cultivation, pulses growing, cultivation of tea, growing
						coffee, growing rubber, growing coconut and growing cashews. Most
						of the time these soil are used to make bricks due to presence of
						large amounts of iron.</li>
				</ul>
				<h2>
					<b>5.Arid Soils:</b>
				</h2>
				<img
					src="https://www.agrifarming.in/wp-content/uploads/2017/09/Arid-Soil..jpg "></img>
				<ul>
					<li><b>Regions :</b> West of the Aravalli.</li>
					<li><b>Characteristics :</b>Arid soils are sandy and have low
						clay content. These soils are deficient of humus and moisture due
						to the fact that high evaporation in arid regions. Arid soils are
						saline in nature due to the high salt content and poor in
						nitrogen. However they are rich in plant food. The colour of arid
						soils range from red to brown.</li>
					<li><b>Suitable Crops of Arid Soils :</b>You can grow any
						drought and saline tolerant crops such as wheat, cotton, corn
						(maize), millers, pulses and barley.</li>
				</ul>
				<h2>
					<b>6.Forest and Mountain Soils:</b>
				</h2>
				<img
					src="https://www.agrifarming.in/wp-content/uploads/2017/09/Forest-and-Moutain-Soil..jpg "></img>
				<ul>
					<li><b>Regions :</b>One can find this type of soils Himalayan
						region, Western and Eastern Ghats and some parts of peninsular
						plateau.</li>
					<li><b>Characteristics :</b>This type of soils are rich in
						organic matter(humus) but are poor in nutrients such as potash,
						phosphorus and lime. These soils are somewhat acidic in nature.
						Crops cultivated in this soils require supplementing the good
						fertilizers.</li>
					<li><b>Suitable Crops of Forest and Mountain Soils :</b>These
						soils are good for cultivating tea, spices, wheat, maize, barley,
						coffee and tropical fruits, and temperate fruits.</li>
				</ul>
				<h2>
					<b>7.Desert Soils:</b>
				</h2>
				<img
					src="data:image/jpeg;base64,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 "></img>
				<ul>
					<li>These soils are sandy and dry and contains some amounts of
						nitrogen are suitable for agriculture with good irrigation
						facility. Generally only drought resistant crops like millet and
						barley can grow in these soils.</li>
				</ul>
				<h2>
					<b>8.Other Soils:</b>
				</h2>
				<ul>
					<li><b>Saline and Alkaline Soils :</b>These soils are too low
						in nutrients and too high in salt for productive agriculture.</li>
					<li><b>Marshy and Peaty Soils :</b>Marsh soils are not
						suitable for crop cultivation due to their high acidic nature.
						Peaty soils have high salt content and good organic matters
						(humus). However, they are deficient nutrients like potash and
						phosphate. Mostly found in Kerala.</li>
				</ul>
				<iframe width="560" height="315"
					src="https://www.youtube.com/embed/4OCtRV9wgJ0" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
				<h2>
					<B>Various Crops that are grown in different Season : </B>
				</h2>
				<h3>Rice</h3>
				<p>The state has 2.2 million ha under rice cultivation, which
					covers mainly irrigated and partly rainfed areas. The state average
					productivity is about 2.8 tonnes/ha. The major constraints in
					production are water scarcity in the existing command areas,
					imbalanced fertilizer use and micronutrient deficiency and
					increasing soil salinity/alkalinity. The suggested interventions
					are:</p>
				<ul>
					<li>Cultivation of hybrids CoRH 2, CoRH 3, ADTRH 1, KRH 2, PHB
						71, PA 6201, DRRH 2</li>
					<li>Growing high-yielding varieties, IR64, IR50, TKM9
						(irrigated), Savithri, Ponni, Co46, ADT 44 (shallow, lowland),
						Vaigai, MDU 1, Paramkudi 1 and PMK (R) 3 (upland) will further

						boost productivity.</li>
					<li>Growing of System of Rice Intesification and other related
						water saving practice</li>
				</ul>
				<h3>Maize</h3>
				<p>Maize is grown in kharif and rabi seasons in the state. The
					major area is under kharif, in which there has been more than five
					times increase from 21,000 ha to 115,000 ha over the last five
					years. There is also a consistent increase in rabi area from 52,000
					ha to 85,000 ha. The productivity has declined drastically in both
					the seasons from 1,552 kg/ha to 1,189 kg/ha. The area from rice is
					being shifted to maize, mainly to be consumed by feed industries.
					The major constraints in production are drought and poor plant
					populations along with quality seeds. The important interventions
					needed are:</p>
				<ul>
					<li>Use of early maturing single cross hybrids QPM 1, Prakash,
						COH (M)4, COH (M) 5</li>
				</ul>
				<h3>Urdbean</h3>
				<p>At present, urdbean occupies 2.34 lakh ha with annual
					production of 1.02 lakh tonnes and average productivity of 436
					kg/ha. There is decreasing trend in area without significant change
					in production. The major constraints are cultivation of traditional
					varieties susceptible to mungbean yellow mosaic virus (MYMV) and
					powdery mildew, infestation of leaf crinkle disease and poor crop
					management. Interventions needed are:</p>
				<ul>
					<li>Growing high-yielding MYMV resistant varieties WBG 26, KU
						301, Bamban 2, TU 94-2 and NWBU 108</li>
					<li>Cultivation of urdbean in rice fallows with powdery mildew
						resistant varieties LBG 623 and LBG 402</li>
					<li>Foliar spraying of 2% urea at flowering and pod filling
						stages</li>
					<li>Seed dressing with carbendazim and inoculation with
						Rhizobium</li>
				</ul>
				<h3>Groundnut</h3>
				<p>Groundnut is cultivated in 6 lakh ha. Its area has almost
					remained static during the last 5 years. The production is
					presently about 7 lakh tonnes. Constraints in production are
					occurrence of early season drought, in-situ germination of kharif
					crop due to terminal rainfall, high incidence of leaf spots, rust,
					peanut bud necrosis disease, collar rot and stem rot. Suggested
					interventions are:</p>
				<ul>
					<li>Moisture conservation techniques like deep ploughing and
						inter culturing</li>
					<li>Growing drought tolerant, early maturing varieties VRI 2,
						VRI 4, Co (Gn) 4, Co (Gn) 5; varieties with inbuilt field dormancy
						VRI 4, CO 4, CO 5 and BSR 1; tolerant varieties ICGV 86590, ALR 2,
						ALR 3 (leafspots, rust, collar rot, stem rot), GPBD 4 (leaf spots
						and rust), VG 9813 (PBND)</li>
					<li>Intercropping groundnut with pigeonpea, castor (7:1), gram
						(6:1) and sesame (5:1 rainfed, 4:1 irrigated) and in-situ
						germination of kharif groundnut</li>
				</ul>
				<h3>Mungbean</h3>
				<p>The area under mungbean is 1.22 lakh ha with annual
					production of 0.35 lakh tonnes and average productivity of 435
					kg/ha. There has been significant increase in area and production
					of mungbean during the last three decades. However, productivity
					gains have been marginal and fluctuated widely and the main
					constraints are poor seed replacement with improvement varieties,
					severe incidence of mungbean yellow mosaic virus and powdery mildew
					and moisture stress. The interventions are:</p>
				<ul>
					<li>Growing high yielding mungbean yellow mosaic
						virus-resistant varieties such as COGG 912,OUM 11-5, HUM 1, CO 6,
						CO 5, ADT 3 and Vamban</li>
					<li>Foliar spraying of 2% urea at flowering and pod filling
						stages</li>
					<li>Seed dressing with carbendazim and inoculation with
						Rhizobium</li>
				</ul>
				<h3>Banana</h3>
				<p>Banana is one of the major crops of Tamil Nadu, commercially
					grown in 81,500 ha with a production of 3.46 million tonnes and a
					productivity of 42.5 tonnes/ha, which is low compared to the
					estimated potential. There is ample scope for enhancing
					productivity through following technological interventions:</p>
				<ul>
					<li>Replacement of Robusta with Grand Naine and Karpuravalli
						with Udhayam</li>
					<li>Planting of disease-free tissue-cultured plants</li>
					<li>High density planting in double row or hill planting</li>
					<li>Integrated insect pests, vectors and disease management</li>
					<li>Fertigation and nutrient management based on tissue
						analysis</li>
				</ul>
				<h3>Mandarin</h3>
				<p>Mandarin is grown in hilly humid terrains of Tamil Nadu; the
					productivity of which can be improved with the adoption of
					following technological interventions:</p>
				<ul>
					<li>Use of disease-free quality planting material</li>
					<li>Soil solarization of nursery to manage soil-borne
						diseases, particularly Phytophthora</li>
					<li>Fertigation and nutrition based on leaf nutrients
						standards</li>
					<li>Rejuvenation of old orchards</li>
				</ul>
				<h3>Coconut</h3>
				<p>Coconut is cultivated in 3.57 lakh ha with a productivity of
					9,083 nuts/ha/year. The potential yield of palm is 175
					nuts/palm/year. The reasons for low productivity are presence of
					large number of senile palms, frequent occurrence of drought, and
					basal stem rot disease. The technologies that can be adopted to
					improve the productivity are:</p>
				<ul>
					<li>Replanting of senile palms with high-yielding varieties
						and hybrids, West Coast Tall, East Coast Tall, Laccadive Ordinary,
						Chadra Kalpa, Andaman Ordinary, VPM 3, Aliyarnagar Tall, Chandra
						Sankara, VHC 2 and VHC 3</li>
					<li>Adoption of soil moisture conservation measures and drip
						irrigation in drought-prone areas</li>
					<li>Adoption of high-density multispecies cropping system with
						pepper, cocoa and turmeric in west Tamil Nadu and banana and
						turmeric in east coast regions</li>
					<li>Adoption of integrated disease management for the control
						of basal stem rot disease</li>
				</ul>
				<h3>Cashew</h3>
				<p>Cashew is cultivated in 1.2 lakh ha with a total production
					of 56,000 tonnes. The productivity is 640 kg/ha. The reasons for
					low productivity are existence of senile seedling plantations and
					low inputs usage. The technologies that can be adopted to improve
					the productivity are:</p>
				<ul>
					<li>Replanting senile plantations with high-yielding variety
						VRI 3</li>
					<li>High-density planting with soil and water conservation and
						fertigation</li>
					<li>Intercropping with groundnut, urdbean, mungbean, ginger
						and medicinal plants in young orchards up to 7 years</li>
				</ul>
				<h3>Farm Tools and Equipment:</h3>
				<p>The tools, equipment and technologies that will help in
					timely completion of farm operations, better placement of inputs
					and drudgery reduction, resulting in higher productivity in
					agriculture and post harvest processing in the state are: laser
					land leveler, rotavator, puddler, paddy seeder/transplanter, cono
					weeder, multi-crop thresher, vertical conveyor reaper, reaper,
					binder, combine, groundnut thresher, groundnut digger shaker,
					sugarcane set cutting machine, sugarcane set cutter planter,
					multi-purpose sugarcane planter, rotary weeder, sugarcane stripper,
					banana clump remover, coconut dehusker, tree climber,</p>
				<h3>Livestock and Poultry:</h3>
				<p>Tamil Nadu has 1.7 million crossbred cattle, 0.8 million
					non-descript cattle and 0.5 million buffaloes in milk, producing
					around 5.5 million tonnes of milk annually, and cows are
					contributing the major share (4.7 million tonnes). Besides, 86.6
					million poultry population is contributing 6.2 billion eggs per
					annum. Among small ruminants, sheep are 5.6 million and goats 8.2
					million. The state has great potential to enhance productivity of
					cattle and poultry with the following technologies:</p>
				<ul>
					<li>Crystoscope assisted Artificial Insemination for improved
						conception rate by 20%</li>
					<li>Complete feed block, urea treatment of poor quality
						fodder, area specific mineral (Ca, P, Cu, Zn) supplementation and
						bypass protein technology for 10-15% improvement in productivity</li>
					<li>Hormonal modulation of poultry in organized farms for 5%
						increase in egg production</li>
					<li>Field based diagnostic kits and vaccines (FMD, HS, IBR)
						for production and income enhancement</li>
					<li>Value addition and improving shelf life of milk (low
						cholesterol ghee, herbal ghee. mango lassi, mozaralla cheese,
						whey-based sports beverage, and flavoured milk) and poultry
						products (chicken chunkalona, chicken patties, chicken idli)</li>
				</ul>
				<h2>Refrences</h2>
				<a
					href=" https://www.agrifarming.in/soil-types-suitable-crops-india#:~:text=This%20is%20also%20popularly%20known,any%20oilseed%20crops%20and%20millets.">assitant</a>
				<a href="https://icar.org.in/files/state-specific/chapter/112.htm">more
					details</a>

			</div>
		</div>
	</div>
	<div id="myModal" class="modal">
		<span class="closebtn">&times;</span> <img class="modal-content"
			id="img01">
		<div id="caption"></div>
	</div>

</body>
<script type="text/javascript">
	function googleTranslateElementInit() {
		new google.translate.TranslateElement({
			pageLanguage : 'en'
		}, 'google_translate_element');
	}
</script>
<script type="text/javascript"
	src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

<script src="JS/jquery.min.js"></script>
<script src="JS/popper.js"></script>
<script src="JS/bootstrap.min.js"></script>
<script src="JS/main.js"></script>
<script src="JS/Shop.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</html>