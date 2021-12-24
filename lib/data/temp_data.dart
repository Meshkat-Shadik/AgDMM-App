import 'package:mock_img_recognition/data/model/data_model.dart';

final riceData = [
  Data(
    cause: 'Bacteria',
    bacteria: 'Xanthomonas oryzae pv. oryzae ',
    symptoms:
        'On seedlings, infected leaves first turn yellow to straw-colored and later wilt and die. On mature plants, the period of occurrence is mainly from tillering to panicle formation. Light green to grayish-green, water-soaked streaks appears first on leaves. As they merge, they form larger yellowish lesions with uneven edges. Leaves become yellow and gradually wilt and die.',
    origin:
        'Symptoms are caused by the bacteria Xanthomonas oryzae pv. oryzae, which can survive on grass weeds or stubbles of infected plants. These pathogens are spread by wind and rain splash or irrigation water.',
    solution: Solution(
      chemical:
          'Bismerthiazole 20% contain Bismerthiazol which is bactericide showed its protective and curative efficacy on controlling rice bacterial blight caused by Xanthomonas oryzae PV. oryzae',
      organic:
          'To this day, no biological products are commercially available to the control bacterial blight in rice. The application of products based on copper can help to alleviate or reduce the symptoms but will not control the disease.',
    ),
    trigger:
        'This disease incidence and severity are increased during bad weather (frequent rainfall, wind), high humidity (above 70%) and warm temperatures (25°C to 34°C). High nitrogen fertilization or close planting also favors the disease, particularly in susceptible varieties. The earlier the disease occurs, the higher the yield loss. The disease occurs in both tropical and temperate environments, particularly in irrigated and rain-fed lowland areas.',
    defensiveStep: [
      "Use only healthy seeds, if possible from a certified source.",
      "Plant resistant rice varieties, this is the most efficient and reliable way to control the disease (and the cheapest!).",
      "	Handle the seedling carefully during transplanting. ",
      "Ensure proper drainage of the fields and nursery to avoid cross-contamination. ",
      "Adjust nitrogen fertilizer applications to avoid excess and split the applications over the season. ",
      "Apply an extra dose of potash along with the last dose of nitrogen when weather conditions are favorable. ",
      "Avoid application of nitrogen in the form of urea. ",
      "Destroy and remove weeds and alternative hosts from channels and surroundings. ",
      "Plow under rice stubble, straw, ratoons and volunteer seedlings which can serve as hosts for the bacteria. ",
      "Allow the fields to dry between the seasons in order to suppress disease agents in the soil and plant residues (fallow). ",
    ],
    //defensiveStep:
  ),
  Data(
    cause: 'Fungus',
    bacteria: 'Magnaporthe oryzae ',
    symptoms:
        'The symptoms of rice blast include lesions that can be found on all parts of the plant, including leaves, leaf collars, necks, panicles, pedicels, and seeds. A recent report shows that even roots can become infected. The basic symptom is Diamond-shaped or elliptical or spindle-shaped spots with grey or white canters and brown margins.',
    origin:
        'Symptoms of rice blast are caused by the fungus Magnaporthe grisea, which is one of the most destructive diseases of rice. The fungus can survive on the straw after harvest and thus be carried over to the next season. Plants usually become less susceptible to the pathogen as they mature.',
    solution: Solution(
      chemical:
          'Tricyclazole 22% + Hexaconazole 3% SC fungicide could be used to control rice blast at weekly interval starting from the booting stage for three times.',
      organic:
          'To this day, no effective biological control of the disease is commercially available.',
    ),
    trigger:
        'The disease is favored by cool temperatures, frequent rainfalls, and low soil moisture. A prolonged period of leaf moisture is also required for infection. In upland rice, sites prone to dew formation (large day to night temperature differences) are at risk. Finally, plants sown in soils with high nitrogen or low silicon levels are more likely to develop the disease.',
    defensiveStep: [
      "Use healthy or certified seed material. ",
      "	Plant resistant varieties available in the area.",
      "	Sow seeds early in the season, after the onset of the rainy season.",
      "	Avoid excessive nitrogen fertilization and split the applications into two or more treatments.",
      "	Avoid drought stress to the plants with regular irrigation.",
      "	Keep a proper flood level for the rice to grow properly.",
      "	Maintain continuous flooding and avoid drainage of the rice field.",
      "	Maintain control of weeds and alternative hosts.",
      "	Apply silicon fertilizers if the soil is known to be silicon deficient.",
      "	Cheap sources of silicon include straws of rice varieties with the high silicon content.",
      "	Monitor your field regularly for symptoms.",
      "	Destroy all infected plant residues to prevent the carry-over of the fungus in the field.",
      "	Plan a crop rotation as a simple and effective way to reduce populations.",
    ],
  ),
  Data(
    cause: 'Fungus ',
    bacteria: 'Cochliobolus miyabeanus',
    symptoms:
        'This disease is characterized by a wide range of symptoms. However, the presence of circular or oval brown spots with a yellow halo during the tillering stage is the most visible sign of the infection. As they enlarge, a gray center develops in the middle of these spots and a reddish-brown margin becomes visible. Stems also become discolored.',
    origin:
        'The symptoms are caused by the fungus, Cochliobolus miyabeanus. It can survive in seeds for more than four years and spread from plant to plant through airborne spores. Infected plant debris left in the field and weeds are other common ways to spread the disease.',
    solution: Solution(
      chemical:
          'The best way to prevent the disease is to use fungicides (e.g., iprodione, propiconazole, azoxystrobin, trifloxystrobin) as seed treatments.',
      organic:
          'To be sure that the seeds are not contaminated, a seed bath in hot water (53-54°C) for 10 to 12 minutes is recommended. To improve the results, place the seeds for 8 hours in cold water before the hot water treatment.',
    ),
    trigger:
        'High humidity (86-100%), prolonged periods of leaf moisture and high temperatures (16-36°C) are very favorable for the fungi.',
    defensiveStep: [
      'For soils that are low in silicon, apply calcium silicate slag before planting.',
      'Acquire your seeds from certified sources if possible.',
      'Ensure a balanced nutrient supply and monitor soil nutrients regularly.',
      'Monitor fields for signs of the disease from the tillering stage.',
      'Control and remove weeds in and around your field.',
      'Remove and destroy infected plants, by burning them after the harvest.',
    ],
  ),
  Data(
    cause: 'Virus',
    bacteria: 'RTBV',
    symptoms:
        'Plants can be infected with either both RTBV and RTSV or with each virus that causes yellow or orange-yellow discoloration in infected plants. Discolored leaves may also have irregular, small, dark-brown blotches.',
    origin:
        'Viruses are transmitted through a leafhopper called Nephotettix virescens. Tungro is rife in fields with high-yielding rice cultivars which have a shorter growth duration, allowing rice growers two crops of rice in a year.',
    solution: Solution(
      chemical:
          'Always consider an integrated approach with preventive measures together with biological treatments if available. Once a rice plant is infected by tungro, it cannot be cured. Preventive measures are more effective than direct disease control. Spraying insecticides based on buprofezin or pymetrozine at 15 and 30 days after transplanting can work if done in a timely manner.',
      organic:
          'Light traps have successfully been used to attract and control the green leafhopper vectors as well as to monitor the population. In the early morning, the population of leafhopper alighting near the light trap should be caught and disposed of, alternatively killed by spraying/dusting insecticides. This should be practiced every day.',
    ),
    trigger:
        'Rice plants in irrigated areas are much more susceptible to develop the disease than rainfed or upland rice. Plant rests and stubbles are also a source of infection.',
    defensiveStep: [
      "Use varieties with some degree of resistance to the vector.",
      "Plant two crops in the months when the vector population is low.",
      "Practice crop rotation with non-host crops.",
      "Schedule the planting to ensure nearly synchronous growth in each area.",
      "Destroy the eggs and breeding sites through plowing.",
      "Adopt alternate wetting and drying the field.",
      "Conserve beneficial insects.",
    ],
  ),
  Data(
    cause: 'Fungus',
    bacteria: 'Monographella albescens',
    symptoms:
        'In most cases, grey-green, water-soaked lesions start to develop on the tips or edges of leaf. Later, the lesions spread and produce a ringed pattern of light tan and dark brown starting from the leaf tips or the edges. The continuous enlargement of lesions result in blighting of a large part of the leaf blade. The affected areas dry out, giving the leaf a scalded appearance.',
    origin:
        'Leaf Scald is a fungal disease which is caused by the fungus called Microdochiumoryzae. The affected areas dry out.',
    solution: Solution(
      chemical:
          'The use of thiophanate-methyl in a seed-soak treatment reduced infection by M. albescens. In the field, foliar sprays with fungicides based on mancozeb, thiophanate methyl @1.0g/l or copper oxychloride significantly reduce the incidence and severity of leaf scald. Combinations of these chemicals are also effective.',
      organic:
          'No alternative treatment has been found so far against this disease.',
    ),
    trigger:
        'Disease development usually occurs late in the season on mature leaves and is favored by wet weather, high nitrogen fertilization, and close spacing. Rates of nitrogen above 40 kg/ha and above result in a greater incidence of leaf scald. It develops faster in affected than in unaffected leaves.',
    defensiveStep: [
      "When available, use resistant varieties.",
      "Increase the spacing between plants during transplanting.",
      "Keep the silicon levels in soil high to reduce the incidence of the disease and get higher yields.",
      "Avoid excessive rates of nitrogen during the fertilization of your crop.",
      "Split applications of nitrogen during the tillering stage.",
      "Remove weeds in and around the field.",
      "Plow under rice stubbles and remove infected rice ratoons.",
    ],
  ),
  Data(
    cause: 'Fungus',
    bacteria: 'Sarocladium oryzae',
    symptoms:
        'Early symptoms are oblong to irregular spots on the leaves (0.5 to 1.5 mm) that enclose the panicles. Spots are characterized by gray centers and brown margins and often merge to form rotting and then discoloration of the leaf sheaths. In severe infections, the young panicles may not emerge. Affected leaf sheaths may have abundant whitish powdery fungal growth visible on the outer surface. Grains of emerged panicles become discolored and sterile.',
    origin:
        'Sheath rot is principally a seed-borne disease. The disease is caused principally by the fungus Sarocladium oryzae but also in some cases by Sacroladium attenuatum. The fungi survive on rice crop residue after harvest and can cause infection in following seasons.',
    solution: Solution(
      chemical:
          'Always consider an integrated approach with preventive measures together with biological treatments if available. In case of severe infestation, the application of fungicides such as mancozeb, copper oxychloride or propiconazole (usually 1 ml/l of water) during booting and panicle emergence at weekly intervals can reduce the incidence of the disease.',
      organic:
          'To this day, no effective biological control of the disease is commercially available.',
    ),
    trigger:
        'Its incidence increases with increasing planting density and in plants that provide entry points for the fungus, in the form of injuries and wounds caused by insects at panicle initiation stage.Hot (20-28°C) and humid (wet) weather favor the growth of the disease.',
    defensiveStep: [
      "Use healthy seeds, if possible from certified sources.",
      "Use a wider planting distance of 25cm x 25cm.",
      "Avoid monocultures in same field by using at least two varieties.",
      "Survey the fields regularly for insects pests like panicle mite and try to keep them under control.",
      "Apply potassium, calcium sulfate or zinc fertilizers at the tillering stage.",
      "Removal of infected stubbles and weeds from the field also helps.",
    ],
  ),
];

/// Bacterial Blight
/// Rice Blast
/// Rice Brown Spot
/// Tungro
/// Leaf Scald
/// Sheath Brown Rot
///
///
///
///
///

final maizeData = [
  Data(
    cause: 'Fungus',
    bacteria: 'Setosphaeria Turcica ',
    symptoms:
        'The symptoms appear as small, oval, water-soaked spots on the lower leaves first. As the disease progresses, they start to appear on the upper part of the plant. Older spots slowly grow into tan, long cigar-shaped necrotic lesions with distinct dark specks and pale green, water-soaked borders.',
    origin:
        'The northern leaf blight disease is caused by the fungus Setosphaeria turcica. The fungus overwinters in the soil or on plant debris.',
    solution: Solution(
      chemical:
          'Apply sprays based on azoxystrobin, picoxystrobin, mancozeb, pyraclostrobin, propiconazole, tetraconazole Apply products based on picoxystrobin + cyproconazole, pyraclostrobin + metconazole, propiconazole + azoxystrobin, prothioconazole + trifloxystrobin. Seed treatments are not recommended.',
      organic:
          'Bio-fungicides based on Trichoderma harzianum, or Bacillus subtilis can be applied at different stages to decrease the risk of infection. Application of sulfur solutions is also effective.',
    ),
    trigger:
        'Rainfall, night dew, high humidity and moderate temperatures favor the dispersion of the the fungus. Carried by wind or rain splashes it first spreads from the soil onto the lower leaves of young maize plants. Rainy conditions and poor field practices favor its spread to other plants and within fields.',
    defensiveStep: [
      "Grow resistant or tolerant varieties.",
      "Ensure balanced nutrient supply and avoid excessive nitrogen fertilization.",
      "Weed regularly in and around the field.",
      "Rotate with soybeans, beans, or sunflower to avoid extensive spreading.",
      "Plow deep to bury plant debris and reduce the amount inoculum in the soil.",
    ],
  ),
  Data(
    cause: 'Fungus',
    bacteria: 'Puccinia Sorghi ',
    symptoms:
        'Minute flecks appear on both sides of the leaves and slowly develop into small, tan, slightly raised spots. These mainly elongated spots later turn into powdery, golden-brown pustules loosely scattered in patches on upper and lower sides. The color can change to black as the plant matures.',
    origin:
        'The disease is caused by the fungus Puccinia sorghi. The fungus overwinters in an alternate host (a species of Oxalis) and releases spores during the spring. The spores can be transported over great distances by winds and rain. They start the infection process when landing on the leaves. Secondary infection from plant to plant can also occur due to wind and rain.',
    solution: Solution(
      chemical:
          'Numerous fungicides are available for rust control. Products containing mancozeb, pyraclostrobin, pyraclostrobin + metconazole, pyraclostrobin + fluxapyroxad, azoxystrobin + propiconazole, trifloxystrobin + prothioconazole can be used to control the disease. An example of treatment could be: Spraying of mancozeb @ 2.5 g/l as soon as pustules appear and repeat at 10 days interval till flowering.',
      organic:
          'No alternative treatment against Puccinia sorghi is available so far. Please get in touch with us in case you know of anything that might help to fight this disease.',
    ),
    trigger:
        'The development of the disease is favored by high relative humidities (nearly 100%), dew, rain and cool temperatures between 15 and 20°C (may vary depending on area). Hot, dry weather will in turn slow or hinder the development of the fungus and the incidence of the disease. It is more a problem in plants used for seed production and sweet corn.',
    defensiveStep: [
      "	Plant resistant varieties available locally.",
      "	Plant early to avoid optimal conditions for infection.",
      "	Use shorter season varieties that mature earlier.",
      "	Monitor your crop regularly for signs of the disease, even more so during overcast weather.",
      "	Ensure balanced fertilization with split applications of nitrogen.",
      "	Plan a crop rotation with non-susceptible crops.",
    ],
  ),
  Data(
    cause: 'Fungus ',
    bacteria: 'Cercospora zeae-maydis ',
    symptoms:
        'Small necrotic (brown or tan) spots that may have a yellow chlorotic halo appear on lower leaves, usually before flowering. Gradually these lesions will turn grayish and appear on younger leaves, too. As the disease progresses, they enlarge into elongated, rectangular lesions that run parallel to the leaf veins.',
    origin:
        'The gray leaf spot disease is caused by the fungus Cercospora zeae-maydis. It survives in plant residues in the soil for long periods of time. During the spring, the spores are carried onto the lower leaves by rain splashes and wind. The fungus completes its lifecycle in 14-21 days in a susceptible variety and in 21-28 days in a resistant one.',
    solution: Solution(
      chemical:
          'Fungicides containing pyraclostrobin and strobilurin, or combinations of azoxystrobin and propiconazole, prothioconazole and trifloxystrobin work well to control the fungus.',
      organic: 'No biological control is available to control this disease.',
    ),
    trigger:
        'Its lifecycle is favored by elevated temperatures (25 to 30°C), high humidity (dews, fogs) and leaf wetness for prolonged periods of time. Hot, dry weather hinders its development.',
    defensiveStep: [
      "	Plant resistant varieties if available in your area.",
      "	Plant late to avoid adverse conditions for plants.",
      "	Keep up good ventilation by widening the space between plants.",
      "	Plow deep and bury all plant residues after harvest.",
      "	Plan long-term crop rotations with non-host plants.",
    ],
  ),
];

final juteData = [
  Data(
    cause: 'Fungus ',
    bacteria: 'Colletotrichum species ',
    symptoms:
        'At seedling stage, the disease appeared on leaf and stem as brownish spot and streaks followed by drying up. On mature plants, initially light yellowish patches are seen on stem which turns to brown/black depressed spots. The spots are irregular in shape and size. Several spots may coalesce causing deep necrosis showing crakes on the stem and exposing the fibre tissues',
    origin: 'Data not collected!',
    solution: Solution(
      chemical: 'Data not collected!',
      organic: 'Data not collected!',
    ),
    trigger: 'Data not collected!',
    defensiveStep: [
      "Data not collected!",
    ],
  ),
  Data(
    cause: 'Fungus ',
    bacteria: 'Botryodiplodia theobromae',
    symptoms:
        'The disease first appears as small blackish brown lesion which gradually enlarges and encircles the stem resulting in withering of epical and side branches. The affected plants loose leaves and turn brown to black and remain standing as dry sticks.',
    origin: 'Data not collected!',
    solution: Solution(
      chemical: 'Data not collected!',
      organic: 'Data not collected!',
    ),
    trigger: 'Data not collected!',
    defensiveStep: [
      "Data not collected!",
    ],
  ),
  Data(
    cause: 'Virus ',
    bacteria: 'Corchorus Golden mosaic',
    symptoms:
        'The disease is characterized by appearance of small yellow flecks on leaf lamina in the initial stage, which gradually increased intermingled with green patches and produced a yellow mosaic appearance. Leaves in some cases produce small enation along the mid vein.',
    origin: 'Data not collected!',
    solution: Solution(
      chemical: 'Data not collected!',
      organic: 'Data not collected!',
    ),
    trigger: 'Data not collected!',
    defensiveStep: [
      "Data not collected!",
    ],
  ),
  Data(
    cause: 'Data not collected! ',
    bacteria: 'Data not collected!',
    symptoms: 'Data not collected!',
    origin: 'Data not collected!',
    solution: Solution(
      chemical: 'Data not collected!',
      organic: 'Data not collected!',
    ),
    trigger: 'Data not collected!',
    defensiveStep: [
      "Data not collected!",
    ],
  ),
  Data(
    cause: 'Data not collected!',
    bacteria: 'Data not collected!',
    symptoms: 'Data not collected!',
    origin: 'Data not collected!',
    solution: Solution(
      chemical: 'Data not collected!',
      organic: 'Data not collected!',
    ),
    trigger: 'Data not collected!',
    defensiveStep: [
      "Data not collected!",
    ],
  ),
];

final soybeanData = [
  Data(
    cause: 'Virus',
    bacteria: 'Alfalfa mosaic virus',
    symptoms:
        'Symptoms are patterns of bright yellow and dark green leaf tissue. Newly emerged leaves may be small with bright yellow spots and brown discoloration and plants may be stunted.',
    origin: 'Data not collected!',
    solution: Solution(
      chemical:
          'Chemical treatment of viral diseases is not possible. The use of insecticides to control aphid population, and thereby the spreading of the virus, is not effective.',
      organic: "Sorry, we don't know of any alternative treatment.",
    ),
    trigger:
        'Well-fertilized fields with high yield potential and high aphid density favor virus transmission.Symptoms are most severe during cool weather and may not be detectable at temperatures above 32°C.',
    defensiveStep: [
      'Be sure to use certified, virus-free seeds.',
      'Use resistant or tolerant varieties.',
      'If possible, choose early planting programs.',
      'Do not rotate soybean with other hosts of the virus.',
      'Control weeds in an around the fields.',
      'Do not over-fertilize your fields during early stages of plant growth.',
    ],
  ),
  Data(
    cause: 'Bacteria',
    bacteria: 'Pseudomonas syringae pv. Glycinea',
    symptoms:
        'Symptoms usually begin in the upper canopy because young leaves are most susceptible. Small, angular, reddish-brown lesions are surrounded by a yellow halo. As the disease progresses, lesions often grow together to produce large, irregularly shaped dead areas. Centers of older lesions frequently fall out, causing leaves to appear tattered.',
    origin:
        'Bacterial blight is caused by the bacterium Pseudomonas savastanoi. It is a seedborne disease that also overwinters in the field on plant residues. Early infections in the seedling stage are usually a sign of contaminated seeds.',
    solution: Solution(
      chemical:
          'Copper fungicides can be used for control of bacterial blight on soybeans but need to be applied early in the disease cycle to be effective.',
      organic: "Sorry, we don't know of any alternative treatment.",
    ),
    trigger:
        'Wet leaf surface will favor the development of the pathogen, which at some point will enter the tissues via wounds or leaf pores. Rain and wind will also favor the secondary spreading within the plant or between plants. The disease if favored by cool (20-25 °C), wet and windy weather (rainstorms) and limited by hot and dry weather.',
    defensiveStep: [
      'Choose varieties that are resistant to the disease.Do not work in the fields when plants are wet to limit the spreading of the disease. ',
      'Incorporate crop residue by tillage after harvest to reduce the amount of inoculum the next season. ',
      'Plan a crop rotation with non-susceptible hosts such as maize, wheat and other non-legumes. ',
    ],
  ),
  Data(
    cause: 'Fungus',
    bacteria: 'Phialophora gregata',
    symptoms:
        'BSR include chlorosis and necrosis between leaf veins. In some instances, no foliar symptoms occur. Foliar symptoms can be similar to those of sudden death syndrome and stem canker and appear after early pod set. Externally, infected stems look healthy. However, when stems are split lengthwise, internal browning of vascular tissue and pith is evident, especially at nodes and in the lower stem. ',
    origin:
        'Caused by Phialophora gregata, a fungus that survives in soybean residue.',
    solution: Solution(
      chemical: "Sorry, we don't know of any alternative treatment",
      organic: "Maintain a soil pH of 7 to reduce the risk of brown stem rot.",
    ),
    trigger:
        'The severity of the disease depends on the ambience, soil environments, and crop management systems. Stem and foliar symptoms are most severe when air temperatures range between 60 and 80 F.',
    defensiveStep: [
      'Adopt best management practices such as crop rotation, especially with the introduction of 2 to 3 years of non-host crops, spaced between soybean.',
      'Other approaches include variety selection and tillage are also proven effective.',
      'Use disease-resistant soybean varieties and cultivars only when high disease pressure is anticipated in an infested field.',
    ],
  ),
];
