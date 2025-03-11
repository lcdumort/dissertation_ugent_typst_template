#import "lib.typ": book, paper

#let symbols = (
  ([$bold(x)$], [three-dimensional position vector ($bold(x) in RR^3$)]),
  ([$psi(bold(x))$], "time-independent wave function"),
  ([$hat(H)$], "Hamiltonian operator"),
  ([$Psi(bold(x), t)$], "time-dependent wave function"),
  ([$bold(r)$], "cartesian coordinates of a collection of atomic nuclei"),
  ([$bold(r)_e$], "cartesian coordinates of a collection of electrons"),
  ([$bold(r)_i$], "cartesian coordinates of atom " + [$i$]),
  ([$bold(r)_(i j)$], "distance vector " + [$bold(r)_i - bold(r)_j$]),
  ([$E(bold(r))$], "ground-state electronic energy at fixed nuclear coordinates " + [$bold(r)$]),
  ([$planck.reduce$], "reduced Planck's constant"),
  ([$k$], "Boltzmann constant"),
  ([$T$], "temperature (in thermodynamic equilibrium)"),
  ([$beta$], "inverse temperature, defined as " + [$(k T)^(-1)$]),
  ([$P$], "pressure (in thermodynamic equilibrium)"),
  ([$p(bold(r))$], "Boltzmann distribution in various ensembles"),
  ([$F$], "Helmholtz free energy"),
  ([$Delta t$], "discretization step in dynamic simulations"),
  ([$c p$], "closed-pore phase"),
  ([$l p$], "closed-pore phase"),
  ([$bold(h)_i$], "node embedding across layers in a graph neural network"),
  ([$E_i$], "atomic energy of atom " + [$i$]),
  ([$bold(q)$], "log probability vector; the number of components is equal to the number of phases which need to be discriminated against"),
)

#let abbreviations = (
  ("QM", "quantum mechanical"),
  ("CPU", "central processing unit"),
  ("GPU", "graphics processing unit"),
  ("Flop", "floating point operation"),
  ("HF", "Hartree-Fock"),
  ("DFT", "density functional theory"),
  ("MP", "Møller-Plesset perturbation theory"),
  ("RPA", "random phase approximation"),
  ("CCSD(T)", "coupled cluster with singles, doubles, and perturbative triples
  excitation"),
  ("MD", "molecular dynamics"),
  ("PBE", "Perdew-Berke-Ernzerhof functional"),
  ("GGA", "generalized gradient approximation"),
  ("D3(BJ)", "Becke-Jonhson dispersion correction"),
  ("D3(TS)", "Tkatchenko-Scheffler dispersion correction"),
  ("DLPNO", "domain local pair natural orbital localization method"),
  ("COSX", "chain of spheres approximation"),
  ("RI", "resolution of identity approximation"),
  ("PBCs", "periodic boundary conditions"),
  ("MOF", "metal-organic framework"),
  ("ML", "machine learning"),
  ("GNN", "graph neural networks"),
  ("MLP", "multilayer perceptron"),
  ("SBC", "smooth basin classification"),
  ("SOTA", "state of the art"),
)

#let preface = [
  This work stands on the shoulders of many:
  my family, my advisor, the jury members, colleagues, friends, but also external
  collaborators, other researchers in the community, contributors
  
   Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ullamcorper urna lorem, sed vestibulum turpis lacinia quis. Fusce gravida ultricies mauris et pretium. Duis tortor leo, posuere id risus luctus, tincidunt congue ligula. Pellentesque magna ex, gravida nec auctor ac, sodales eu felis. In id hendrerit leo. Proin varius ullamcorper neque, a mattis lacus elementum sed. Sed tellus ligula, elementum  sagittis sed, maximus  sapien. Maecenas lacinia porta sem a venenatis.

Nunc malesuada semper hendrerit. Donec vehicula fermentum sem. Morbi venenatis varius dui. Nulla erat purus, luctus non dictum ac, suscipit feugiat elit. Maecenas id neque eu justo lacinia tempus nec quis tortor. Aliquam quis nunc ut augue pellentesque aliquet rhoncus ligula. Suspendisse at sem at nisl tristique ultrices non id erat. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed ultrices diam quis semper. Mauris fermentum est at felis convallis, eget posuere leo imperdiet. 

  #align(right)[-- Your name]
]

#let quote = (
  v(7em) +
  grid(
    columns: (auto, auto),
    gutter: 0.8em,
    row-gutter: 2em,
    align: (right + top, left + top),
    "JM:",
    par(justify: true)[_"Donec malesuada lacus ut ex auctor fermentum. Fusce posuere lacus neque eleifend cursus. Maecenas quis rutrum massa. Maecenas auctor nulla quis lacus sagittis auctor. In porta orci vcondimentum ullamcorper."_],
    [SJ:],
    par(justify: true)[_" Nunc malesuada semper hendrerit. Donec vehicula fermentum sem. Morbi venenatis varius dui. Nulla erat purus, luctus non dictum ac, suscipit feugiat elit. Maecenas id neque eu justo lacinia tempus nec quis tortor. Aliquam quis nunc ut augue pellentesque aliquet vrhoncus ligula. Suspendisse at sem at nisl tristique ultrices non id erat. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed ultrices diam quis semper. Mauris fermentum est at felis convallis, eget posuere leo imperdiet.
Donec malesuada lacus ut ex auctor fermentum. Fusce posuere lacus neque eleifend cursus. Maecenas quis rutrum massa. Maecenas auctor nulla quis lacus sagittis auctor. In porta orci condimentum ullamcorper. Praesent vel laoreet eros, ac rutrum nibh. Ut vel ornare tortor, sed rutrum magna. Phasellus quis felis rhoncus, interdum elit ut, finibus justo. "_],
  ) 

)
// #let summary = "/"
#let summary = [

// add DOI links

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam pellentesque luctus magna nec faucibus. Fusce eget massa id massa fringilla vehicula ut et sem. Cras suscipit rutrum posuere. Nulla finibus massa ac lorem malesuada tempus ut ut nisi. Ut ac nulla vsem faucibus eleifend sed non sem. Sed sollicitudin ante at nisi pulvinar vestibulum. Phasellus condimentum at est sed ornare. Fusce elit urna, feugiat sit amet ullamcorper , fermentum non nibh. Sed malesuada, diam id malesuada eleifend, nibh velit mollis lorem, hendrerit ultrices risus lacus sit amet odio. Vivamus imperdiet nisi sed neque tristique malesuada. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc tortor diam, semper eget elit id, faucibus consectetur mi. Nullam mattis, ante non consequat euismod, lectus dui vulputate velit, et convallis massa metus ac diam. Sed lobortis venenatis velit, convallis lectus pharetra eu. Vivamus ut lacus efficitur, dictum quam vel, tincidunt dolor. Curabitur neque nibh.

Aliquam tellus ipsum, ultricies ac ultricies sit amet, ultrices sollicitudin magna. Vivamus libero erat, faucibus at varius in, finibus sit amet nisi. Vestibulum suscipit sodales pharetra. Nulla vel purus et lorem sagittis tincidunt. Vivamus pharetra mi ut purus lacinia, sit amet vulputate sem lobortis. Cras at molestie mauris. Morbi iaculis diam vel bibendum accumsan. Vivamus non faucibus orci. Duis pulvinar ut lectus eget elementum. Duis eu lectus id mi molestie facilisis. Cras ultrices tortor vel eros dignissim, at tempor odio egestas. In a felis mi. Aliquam orci nisl, cursus at dui nec, placerat semper libero. Lorem ipsum dolor sit amet, consectetur adipiscing elit.

Curabitur eu elementum nisl. Sed viverra hendrerit elit ut varius. Vivamus tortor ut mi vestibulum bibendum ut in est. Aliquam hendrerit id mi vel convallis. Vivamus cursus nisl nec varius malesuada. In arcu odio, rutrum ac magna quis, dapibus accumsan purus. Morbi rhoncus lacinia magna in dapibus. Nullam hendrerit massa interdum metus dapibus, ac sollicitudin massa blandit. Duis ut varius sem. Vivamus neque justo, elementum vel tincidunt et, aliquet vel tortor. Integer sodales vel turpis interdum tempor. Aliquam pellentesque sagittis enim, id aliquam felis interdum quis. Nunc lorem lorem, consectetur a est , scelerisque pretium nisi. Quisque mollis felis magna, sed cursus purus volutpat eu.

Donec maximus tempus risus, nec dapibus eros ornare eget. Sed eget massa et ante aliquet elementum sit amet quis diam. Sed mollis cursus nisl vel lacinia. Pellentesque cursus ultricies iaculis. Pellentesque rhoncus pharetra sapien, a rhoncus turpis vestibulum nec. In sit amet iaculis ligula. Phasellus malesuada dui nec orci sagittis pharetra. Quisque ullamcorper est id nisl vehicula, ultrices gravida nisi hendrerit. Pellentesque quis luctus mi. Duis malesuada quis arcu at dictum. Nulla ut mi sollicitudin, porttitor ex eu, scelerisque elit. Vestibulum bibendum nibh.

Pellentesque pulvinar eget tortor eget gravida. Integer dolor ante, rutrum id urna nec, bibendum malesuada libero. Pellentesque ac lorem eu eros interdum lacinia sed eget urna. Pellentesque sit amet nisl nec felis sagittis consectetur ultrices vdiam. Pellentesque euismod diam suscipit laoreet. Mauris vel faucibus mi, at aliquam nisi. Quisque felis magna, tempor in odio sed, pulvinar vulputate neque. Praesent sed elit eu ligula porttitor pretium. Sed fringilla libero eget lacus vehicula, eu accumsan tortor tristique. Nunc vulputate feugiat dolor eget auctor. Mauris nec velit in mauris molestie facilisis. Sed quis ullamcorper leo, sed pellentesque arcu. Fusce laoreet tincidunt rhoncus. Vestibulum erat arcu, vulputate ac orci , rutrum faucibus nibh. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent tempus orci sit amet fermentum porttitor. 

]

#let samenvatting = [


Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean in viverra elit. Sed ut ipsum eget sapien hendrerit elementum id nec ligula. Suspendisse potenti. In eu arcu mattis, ultricies est quis, interdum odio. Cras cursus congue egestas. Phasellus sollicitudin massa vel tortor dignissim, fringilla tempus odio viverra. Phasellus aliquet risus dolor, consequat luctus nisl efficitur eget. Suspendisse lobortis turpis eget nisi molestie semper. Mauris fermentum tellus ut felis finibus, a rutrum nulla ornare. Aenean accumsan accumsan enim id auctor. Ut ac dignissim quam, vmollis ligula. In ultrices nisi sed ipsum blandit, in blandit eros tincidunt. Aliquam eleifend cursus nibh quis interdum. Quisque laoreet magna non bibendum euismod.

In sagittis mi quis diam condimentum, ut posuere elit elementum. Donec nec nunc sed turpis mollis sagittis. Morbi orci risus, interdum et laoreet a, porttitor et risus. Aenean scelerisque semper aliquam. Praesent eget dignissim elit. Nulla eu facilisis nunc. Quisque sodales rhoncus nibh, sit amet rutrum arcu feugiat eget. Phasellus sed gravida ligula, ac lobortis urna.

Pellentesque ultricies efficitur fringilla. Mauris laoreet varius volutpat. In ut odio ut mi bibendum placerat sed a justo. Morbi lorem dolor, fringilla ac dictum posuere, vehicula porta ipsum. Nullam sem erat, pharetra quis faucibus quis, suscipit id libero. Nulla eget auctor nibh. Cras congue gravida leo, at viverra risus ultrices at. Donec eleifend, quam eget placerat laoreet, ante sapien euismod mi, auctor ultricies ipsum dolor ac urna. Ut laoreet orci non tellus consequat, eu mollis eros iaculis. Proin a ipsum sed lorem mollis tristique. Sed condimentum, sapien sit amet gravida fringilla, augue nunc rutrum metus, elementum ipsum quam id quam. Duis convallis dui non posuere dignissim. Nullam varius elit nisl, ac tincidunt magna placerat pharetra.

Nunc ut odio bibendum, feugiat arcu id, aliquam turpis. Donec facilisis posuere odio aliquet varius. Cras eleifend ac enim sit amet mattis. Etiam cursus lacus egestas sapien luctus, eget pharetra arcu interdum. Pellentesque bibendum nibh massa, sit amet vestibulum velit eleifend eu. Suspendisse et volutpat libero. Morbi vehicula, lorem ac commodo malesuada, lacus mauris facilisis lorem, nec volutpat felis nisi diam. Donec eu maximus dui, eget pellentesque velit. Mauris pretium dolor eu ligula cursus, ut imperdiet turpis dapibus. Morbi luctus euismod bibendum. Sed euismod, metus eget rutrum venenatis, libero libero suscipit nisl, suscipit dolor metus a sem. Pellentesque ac lacus accumsan, molestie neque at, dapibus diam. Curabitur ut tincidunt ex. Fusce posuere arcu arcu ullamcorper elementum. Aliquam vel molestie lacus.

Morbi sed varius ante, nec dapibus quam. Aenean nec mauris et quam imperdiet tincidunt eu eget magna. Nunc felis id sem pharetra accumsan. Ut iaculis bibendum urna id dictum. Aliquam convallis tincidunt semper. Nam finibus tortor id ligula iaculis, vel facilisis magna tempor. Ut venenatis, nunc condimentum consectetur sodales, ante enim tempus lorem, quis molestie leo leo quis urna. Quisque eu dapibus dolor, ut consequat nunc. Proin sed dictum quam. Curabitur turpis elit, semper elit pretium, elementum ornare ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nullam auctor condimentum venenatis. 
]

#let paper1 = (
  number: "I",
  title: "Title of the Paper Goes Here",
  authors: "Author Name, Co-Author Name, Another Author",
  journal: [_Journal Name_, *Year*, _Volume_, Page Number],
  contributor: "Author Name performed the simulations and contributed to the analysis.",
  copyright: "Copyright (Year), The Authors",
  num_pages: 11,
  location: "dumortier-et-al-2024",
)

#let paper2 = (
  number: "II",
  title: "Title of the Paper Goes Here",
  authors: "Author Name, Co-Author Name, Another Author",
  journal: [_Journal Name_, *Year*, _Volume_, Page Number],
  contributor: "Author Name performed the simulations and contributed to the analysis.",
  copyright: "Copyright (Year), The Authors",
  num_pages: 22,
  location: "dumortier-et-al-2025",
)


#let publications = (
  (
    title: "Title of the First Paper Goes Here",
    authors: [Author One, Author Two, #underline[Highlighted Author], Author Four, Author Five, Author Six],
    journal: [_Journal Name_ (accepted), *Year*],
  ),
  (
    title: "Title of the Second Paper Goes Here",
    authors: [#underline[Highlighted Author]#super[#sym.dagger], Co-Author One#super[#sym.dagger], 
    Last Author #linebreak() #super[#sym.dagger]: these authors contributed 
    equally],
    journal: [_Journal Name_ (accepted), Article ID, *Year*],
  )
)

#let presentations = (
  (
    title: "(invited) Title of the First Presentation",
    authors: [#underline[Presenter Name], Co-Author One, Co-Author Two],
    event: "Conference or Event Name",
    date: "Month Year",
    location: "City, Country",
  ),
  (
    title: "Title of the Second Presentation",
    authors: [#underline[Presenter Name], Co-Author One, Co-Author Two],
    event: "Conference or Event Name",
    date: "Month Year",
    location: "City, Country",
  )
)


#let appendices = (
  (
    title: "Some Details about some method",
    body: [
This section provides additional details on the topic discussed in Figure X.X. 
We utilize SoftwareName, a widely used computational package that implements 
various advanced approximations. 

While these approximations enhance computational efficiency, they also introduce 
complexities in evaluating gradients (i.e., atomic forces). For example, SoftwareName 
version X.X, released in Year, does not yet support force calculations with MethodName, 
despite its widespread use for over a decade.


  #pagebreak()
    ],
  ),
  (
    title: "Some Details About Some DataSet",
    body: [
      For Figure X.X, we consider a cluster of MoleculeType molecules of varying size, ranging 
from one molecule to N molecules. The calculations were performed on a computing node 
with Processor Model and Y GB RAM, using Z cores per calculation to obtain objective scaling data.

The following computational setups were used:
- *Method 1*: Something important
    ],
  ),
)

#let acknowledgements = grid(
    columns: 2,
    row-gutter: 5mm,
    column-gutter: 10mm,
    align: (center + horizon, center + horizon),
    image("logos/LUMI.png", width: 13em),
    image("logos/meluxina.png", width: 13em),
    [Part of the simulations were performed on LUMI -- we acknowledge the LUMI User
    Support Team for their expert support.],
    [Part of the simulations were performed on the Luxembourg national supercomputer
    MeluXina. The authors gratefully acknowledge the LuxProvide teams for their expert
    support.],
    image("logos/EuroHPC.png", width: 13em) + linebreak(),
    image("logos/fwo.png", width: 13em) + linebreak(),
    [We acknowledge EuroHPC Joint Undertaking for providing access to state of the art computing
      infrastructure in Europe],
    [We acknowledge the Research Foundation - Flanders (FWO) for a doctoral fellowship (grant no.)],
  ) + image("logos/VSC.png", width: 20em) + linebreak() + [We acknowledge VSC for their Tier1 infrastructure]

#show: book.with(
  title: [Title of the Dissertation Goes Here],
  author: "Author Name",
  symbols: symbols,
  abbreviations: abbreviations,
  quote: quote,
  preface: preface,
  summary: summary,
  samenvatting: samenvatting,
  papers: (paper1, paper2),
  publications: publications,
  presentations: presentations,
  appendices: appendices,
  acknowledgements: acknowledgements,
)



= Introduction
<introduction>

 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eu dolor ex. Nullam pulvinar, nibh pretium rutrum lobortis, diam libero consequat neque, at tempor nibh nunc eget augue. Pellentesque varius sollicitudin varius. Fusce consequat non nisi eu gravida. Integer scelerisque finibus purus ut iaculis. Curabitur sagittis nec tellus quis efficitur. Aliquam non mi feugiat, dapibus tortor sed, euismod nibh. Nam justo magna, tempor id ligula vel, euismod suscipit ex. Etiam id tincidunt sapien. Vestibulum tempor accumsan orci, vitae bibendum nunc euismod vel. Suspendisse lobortis ullamcorper urna, eu convallis ex vehicula vitae. Integer justo ante, auctor fermentum lobortis a, venenatis non purus. Nam augue nisi, bibendum non molestie at, gravida at mauris.

Nulla porttitor semper lorem ut laoreet. Ut varius lacus in faucibus cursus. Praesent nisi neque, pellentesque vel gravida ac, elementum sit amet sapien. Donec finibus nec lacus a vulputate. Duis id eleifend nisl. Suspendisse potenti. Etiam sit amet tortor rhoncus, euismod elit non, interdum risus. Pellentesque ut augue sapien. Nullam pulvinar eget mi id feugiat. Mauris malesuada, odio et tincidunt hendrerit, lectus nibh ornare urna, eu pretium metus leo a sapien.

Maecenas nec lacus mollis neque viverra suscipit nec ut lorem. Ut tincidunt ultricies nibh. Proin lacus velit, porttitor eget dapibus at, ullamcorper a augue. Ut justo nisi, interdum vel mattis eget, facilisis sed mauris. Aliquam dictum lacinia iaculis. Aliquam blandit metus at tellus vestibulum, vel luctus lacus faucibus. Curabitur volutpat odio dolor, vitae pretium nisi aliquam ac. In ac ante lectus.

Vivamus tincidunt lectus sodales pretium placerat. Nunc at nibh ac neque ornare euismod at et purus. Vivamus rutrum orci bibendum, condimentum tortor nec, semper velit. Phasellus consectetur, neque vel pulvinar finibus, massa quam tempus arcu, ultrices viverra nulla turpis id risus. Pellentesque iaculis efficitur tellus, sed sagittis neque tempor eu. Sed dignissim ultricies nibh nec tempor. Donec finibus mauris in iaculis congue. 

== Quantum mechanics

 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eu dolor ex. Nullam pulvinar, nibh pretium rutrum lobortis, diam libero consequat neque, at tempor nibh nunc eget augue. Pellentesque varius sollicitudin varius. Fusce consequat non nisi eu gravida. Integer scelerisque finibus purus ut iaculis. Curabitur sagittis nec tellus quis efficitur. Aliquam non mi feugiat, dapibus tortor sed, euismod nibh. Nam justo magna, tempor id ligula vel, euismod suscipit ex. Etiam id tincidunt sapien. Vestibulum tempor accumsan orci, vitae bibendum nunc euismod vel. Suspendisse lobortis ullamcorper urna, eu convallis ex vehicula vitae. Integer justo ante, auctor fermentum lobortis a, venenatis non purus. Nam augue nisi, bibendum non molestie at, gravida at mauris.

Nulla porttitor semper lorem ut laoreet. Ut varius lacus in faucibus cursus. Praesent nisi neque, pellentesque vel gravida ac, elementum sit amet sapien. Donec finibus nec lacus a vulputate. Duis id eleifend nisl. Suspendisse potenti. Etiam sit amet tortor rhoncus, euismod elit non, interdum risus. Pellentesque ut augue sapien. Nullam pulvinar eget mi id feugiat. Mauris malesuada, odio et tincidunt hendrerit, lectus nibh ornare urna, eu pretium metus leo a sapien.

Maecenas nec lacus mollis neque viverra suscipit nec ut lorem. Ut tincidunt ultricies nibh. Proin lacus velit, porttitor eget dapibus at, ullamcorper a augue. Ut justo nisi, interdum vel mattis eget, facilisis sed mauris. Aliquam dictum lacinia iaculis. Aliquam blandit metus at tellus vestibulum, vel luctus lacus faucibus. Curabitur volutpat odio dolor, vitae pretium nisi aliquam ac. In ac ante lectus.

Vivamus tincidunt lectus sodales pretium placerat. Nunc at nibh ac neque ornare euismod at et purus. Vivamus rutrum orci bibendum, condimentum tortor nec, semper velit. Phasellus consectetur, neque vel pulvinar finibus, massa quam tempus arcu, ultrices viverra nulla turpis id risus. Pellentesque iaculis efficitur tellus, sed sagittis neque tempor eu. Sed dignissim ultricies nibh nec tempor. Donec finibus mauris in iaculis congue. 

#footnote[Ut iaculis, magna at posuere ullamcorper, elit massa tempus lectus, eget facilisis ex nibh vitae sem. Nullam vehicula efficitur lorem in venenatis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Etiam facilisis gravida orci, nec egestas dui pulvinar id. Donec at nibh aliquet, consectetur magna sit amet, vehicula tortor. Pellentesque lacus nulla, viverra eu aliquet a, gravida a ]

 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce nec diam mi. Donec rutrum convallis maximus. Aenean malesuada tellus sit amet enim dapibus, in varius purus vulputate. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vivamus tincidunt malesuada mi at mollis. Nulla nec venenatis purus. Cras sit amet lobortis nisl. Proin quis massa eget ligula finibus imperdiet.

Mauris imperdiet tellus at porta dignissim. Ut venenatis lorem posuere, venenatis justo id, auctor sem. Pellentesque suscipit metus eget ipsum varius pulvinar. Curabitur ornare, odio a mattis euismod, turpis quam auctor mauris, et mollis orci erat vel mauris. Donec sollicitudin, sem at euismod pulvinar, ligula turpis imperdiet leo, eget lobortis massa leo vel risus. Duis dictum sagittis ipsum porta varius. Praesent mattis metus at dolor vehicula, ac placerat dolor vehicula. Praesent finibus erat a iaculis molestie. Etiam iaculis erat nulla, eget pellentesque odio dignissim non. Ut bibendum nec tellus non auctor. Donec a urna sed dolor sodales sollicitudin in mattis turpis. Morbi sodales, quam a facilisis consequat, ligula enim sagittis neque, nec iaculis nisi lacus vitae velit. Morbi venenatis, massa eget pulvinar pharetra, augue nulla elementum magna, a cursus nisl massa at turpis. Vivamus sit amet feugiat metus. Quisque in placerat elit. Aenean dignissim velit purus, non sagittis nisl molestie eu. 


== Statistical mechanics



- *something important*:Morbi nisl metus, malesuada aliquam cursus a, accumsan vel libero. Aenean ultricies dignissim sem non imperdiet. Nunc tempor, purus sit amet varius aliquam, metus massa molestie nibh, eget pharetra ipsum libero a nulla. Donec porttitor libero eros, ac pharetra justo ultrices ut. Vivamus sodales sapien vel velit elementum fermentum. Suspendisse sit amet erat massa. Vivamus bibendum lacus dui, imperdiet blandit erat varius a. Etiam non mauris massa. Donec ultricies velit turpis, nec elementum ante dapibus non. Donec elit ex, porta eu enim vel, laoreet vulputate nisl. Praesent sed ex convallis, semper lectus nec, rhoncus orci. Nullam ac ligula laoreet, cursus ante vel, euismod est. Nunc feugiat, felis eget luctus interdum, orci sapien tincidunt purus, id fermentum risus turpis eu arcu. Nam tempus mi quis ante varius faucibus id vel purus. Suspendisse potenti.  
- *also important*: Ut tristique id libero vel dignissim. Ut aliquet ex eget quam fermentum, at sollicitudin nibh placerat. Ut leo diam, pharetra sed interdum non, tristique id felis. Quisque ac mattis ante, eu bibendum ex. Suspendisse potenti. Aenean placerat nibh a arcu gravida, consequat dapibus urna tempor. Nam gravida ultrices lacinia. Pellentesque interdum, mauris in suscipit auctor, nunc leo condimentum leo, id interdum arcu magna sit amet massa. Duis interdum a neque id tristique. Integer auctor in sapien vel malesuada. Cras rhoncus suscipit orci id viverra. Donec mi mauris, dictum et sollicitudin sit amet, imperdiet at magna. Sed blandit nulla nibh, non aliquet nibh feugiat eu. 
The foundation of statistical mechanics is that --


== Molecular simulation


Mauris imperdiet tellus at porta dignissim. Ut venenatis lorem posuere, venenatis justo id, auctor sem. Pellentesque suscipit metus eget ipsum varius pulvinar. Curabitur ornare, odio a mattis euismod, turpis quam auctor mauris, et mollis orci erat vel mauris. Donec sollicitudin, sem at euismod pulvinar, ligula turpis imperdiet leo, eget lobortis massa leo vel risus. Duis dictum sagittis ipsum porta varius. Praesent mattis metus at dolor vehicula, ac placerat dolor vehicula. Praesent finibus erat a iaculis molestie. Etiam iaculis erat nulla, eget pellentesque odio dignissim non. Ut bibendum nec tellus non auctor. Donec a urna sed dolor sodales sollicitudin in mattis turpis. Morbi sodales, quam a facilisis consequat, ligula enim sagittis neque, nec iaculis nisi lacus vitae velit. Morbi venenatis, massa eget pulvinar pharetra, augue nulla elementum magna, a cursus nisl massa at turpis. Vivamus sit amet feugiat metus. Quisque in placerat elit. Aenean dignissim velit purus, non sagittis nisl molestie eu.

Morbi nisl metus, malesuada aliquam cursus a, accumsan vel libero. Aenean ultricies dignissim sem non imperdiet. Nunc tempor, purus sit amet varius aliquam, metus massa molestie nibh, eget pharetra ipsum libero a nulla. Donec porttitor libero eros, ac pharetra justo ultrices ut. Vivamus sodales sapien vel velit elementum fermentum. Suspendisse sit amet erat massa. Vivamus bibendum lacus dui, imperdiet blandit erat varius a. Etiam non mauris massa. Donec ultricies velit turpis, nec elementum ante dapibus non. Donec elit ex, porta eu enim vel, laoreet vulputate nisl. Praesent sed ex convallis, semper lectus nec, rhoncus orci. Nullam ac ligula laoreet, cursus ante vel, euismod est. Nunc feugiat, felis eget luctus interdum, orci sapien tincidunt purus, id fermentum risus turpis eu arcu. Nam tempus mi quis ante varius faucibus id vel purus. Suspendisse potenti. 
#pagebreak(to: "odd")

