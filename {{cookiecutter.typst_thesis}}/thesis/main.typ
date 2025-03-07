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
  to open-source software packages, funding agencies, and even my high school mathematics
  teacher; all of them have played a significant role in one way or another. Instead of a
  complete enumeration, I will highlight a few of the people whose contribution to this work has
  been most important.

  First, I want to thank my advisor, Veronique. From day one, you have given me
  #emph[carte blanche] and encouraged me to pursue my own research ideas; you created
  precisely the kind of environment I needed to perform at my very best.
  // On a more personal level, you have demonstrated a lot of patience towards my chaotic, persistent, and
  // procrastinative personality traits, and while I have always taken this for granted, I
  // realize now that I should be very grateful for this.
  Beyond your academic guidance, you have always been very patient towards my
  somewhat chaotic work habits, and only now do I fully appreciate that.
  I hope that my work will, in some way, prove useful to your future research purposes.

  Second, I want to thank my jury members. I am really happy with the rigorous discussion
  we had during my internal defense.
  Honestly, I wish I could have convened this committee of researchers
  regularly throughout my PhD as to benefit even more from your expertise and critical
  review.
  Thank you for your careful reading of an earlier version of this thesis; I have tried to
  incorporate your helpful comments and suggestions to the best of my ability.

  I used to believe that the universe was made from elementary particles which follow the
  laws of physics. But then I look at my parents, and I realize there must be something
  more. Thank you so, so much.

  #align(right)[-- Sander]
]

#let quote = (
  v(7em) +
  grid(
    columns: (auto, auto),
    gutter: 0.8em,
    row-gutter: 2em,
    align: (right + top, left + top),
    "JM:",
    par(justify: true)[_"If this was going to be viewed forever by young
    high school kids and college kids — young entrepreneurs who want to go out and do
    something while they're still young. [...] What advice would you give them?"_],
    [SJ:],
    par(justify: true)[_"The thing I would say is, when you grow up, you tend to get
    told that the world is the way it is, and your life is just to live your life inside
    the world. Try not to bash into the walls too much. Try to have a nice family life,
    have fun, save a little money. But that's a very limited life. Life can be much
    broader once you discover one simple fact, and that is: everything around you that you
    call life was made up by people that were no smarter than you. And you can change it.
    You can influence it. You can build your own things that other people can use. And the
    minute that you understand that you can poke life, and actually something will, you
    know, if you push in, something will pop out the other side, that you can change it.
    You can mold it. That's maybe the most important thing, to shake off this erroneous
    notion that life is there and you're just going to live in it, versus embrace it.
    Change it. Improve it. Make your mark upon it. I think that's very important. And
    however you learn that, once you learn it, you'll want to change life and make it
    better, because it's kind of messed up in a lot of ways. Once you learn that, you'll
    never be the same again"_],
  ) 

)
// #let summary = "/"
#let summary = [

// add DOI links

Historically, the most significant technological breakthroughs were often preceded by the discovery of
a particular material or molecule.
For example, #emph[semiconductor] materials induced the transformation from physically enormous
mechanical computers in the 1950s into today's powerful handheld devices,
and the #emph[penicillin] molecule revolutionized health care as the first effective treatment against
deadly bacteria.
Today's society is faced with monumental challenges, and we will likely require specialized materials and molecules to tackle them.
Fortunately, the properties of materials and molecules
can be understood based on the laws of quantum and statistical mechanics, and it is
therefore theoretically possible to design them for specific applications.
Unfortunately, their design space is incredibly large --
with approximately 94 naturally occurring elements that can be combined in virtually infinite ways --
and the equations for predicting their
properties are far too complicated to be solved by hand.

Computer simulations may provide a viable alternative.
Computing power has been growing almost exponentially since the 1970s, and today's
exascale systems may provide us with enough capacity to predict the physical and chemical
properties of many molecules and materials.
As such, it would be possible to perform a #emph[screening] across all possible combinations of atomic
arrangements and find, for example, new materials with superconductive behavior at ambient
conditions, or new molecules which bind to specific target proteins.
One of the key challenges in this approach is the enormous computational cost that
is associated with explicit simulation of the equations of quantum and statistical
mechanics.
Over the past few decades, researchers have developed a large variety of
approximate methods which can be used to alleviate a large portion of the total cost.
Despite significant advances in approximation techniques,
current methods present an unsatisfactory trade-off between accuracy and computational efficiency:
methods that achieve chemical accuracy
remain prohibitively expensive for large-scale screening applications,
while faster approximations introduce errors that render their predictions unreliable.
Even with projected increases in computing power over the next decade,
this fundamental limitation would persist.

Machine learning has recently established itself as an extraordinary tool for scientific
discovery;
the 2024 Nobel prizes in both physics and chemistry were
awarded to #emph[machine learning] scientists.
For molecular simulation in particular, machine learning has the ability to improve the
accuracy-cost tradeoff by orders of magnitude. However, its application to complex molecular
systems remains very challenging.
As such, the main goal of this work is to develop scalable machine learning algorithms to advance
and accelerate computational research into chemical and physical processes in nanostructured
materials, with a particular focus on metal-organic frameworks and zeolites because of
their extraordinary properties in the context of gas storage and catalysis applications.

To understand how machine learning can improve the accuracy-cost
tradeoff, we must first examine what makes molecular simulations computationally intensive.
On an abstract level, dynamic simulations can be viewed as a long, repeating sequence of
steps.
Each step represents a single application of Newton's equations of motion: we evaluate
the interatomic forces with quantum mechanics and use them to advance the atomic positions over a very small time
interval.
By repeating this over and over, we simulate the dynamics of individual atoms and are able
to predict their physical properties.
The computational challenges in such simulations are therefore twofold: how do we reduce the cost of a single
such step (i.e. the quantum mechanical energy and force evaluation), and how do we reduce the total
number of steps (i.e. the total simulation time).
The main contribution of the research in this thesis is the development of new machine
learning techniques which advance the state of the art for both these challenges.

For the first challenge, we build upon a large body of prior research on the application
of machine learning to materials and molecules.
A machine learning model considers a material or molecule as a three-dimensional
arrangements of atoms (with or without periodicity),
and its task is to predict the quantum mechanical interaction
energy and the interatomic forces (as required for dynamic simulations).
Such models have demonstrated excellent performance on benchmark datasets, but their
application to nanoporous materials had not yet been explored.
The key difficulty relates to the generation of high-quality training data which contain
the target energy and forces that the model needs to learn to predict.
On one hand, the generation of such training data can be very challenging for
metal-organic frameworks and zeolites due to their chemical variety and potential
metastable behavior.
On the other hand, the most accurate quantum mechanical (wave-function-based) methods can sometimes only compute the interaction
energy and not the interatomic forces even though they are required during training.
We tackle these problems using a combination of on-the-fly learning for data generation
and transfer learning to bypass the need for high fidelity interatomic forces.

For the second challenge -- reducing the total simulation time -- we are inspired by
existing #emph[rare event] sampling algorithms which rely on system-specific
knowledge to accelerate the effective dynamics such that slow or rare events happen much more
quickly or frequently.
The main bottleneck in these approaches is the requirement of a system-specific
reaction coordinate whose definition usually involves specialized knowledge and
at least some level of human trial and error.
We developed a universal machine learning approach which augments the energy prediction models
with knowledge regarding the rare event in a way that allows us to generate reaction
coordinates for chemical and physical transformations in a generic manner.
Moreover, by careful consideration of the required symmetries, we demonstrate state of the art
performance on a variety of applications.

We conclude this summary with a brief outline of the thesis.
Chapters 1 & 2 introduce the fundamentals of molecular simulation, and elaborate in more detail
on the twofold computational challenge as well as traditional approximations and techniques to
overcome them.
Chapters 3 & 4 present the main research results, with Chapter 3 focusing on the first
challenge using on-the-fly learning and transfer learning, and Chapter 4 focusing on
learned rare event sampling.
Chapter 5 integrates the research results into `psiflow`: a molecular simulation framework that
facilitates the deployment of these techniques on large amounts of compute resources with
minimal human effort.
Finally, we formulate our overall conclusions and perspectives for future research in
Chapter 6.

]

// These conventional approaches come with severe limitations.
// Classical force fields trade in accuracy for computational efficiency and their area of
// application is restricted to nonreactive phenomena -- essentially excluding all of
// catalysis and most of materials science.
// Enhanced sampling methods are incredibly powerful but often require the definition of a
// reaction coordinate, which is highly system-specific and not always possible.
// In recent years, machine learning has revolutionized the field, with efficient ML models
// which can learn the interaction energy $E(bold(r))$ and collective variables

#let samenvatting = [
Doorheen de geschiedenis werden de belangrijkste technologische doorbraken vaak
voorafgegaan door de ontdekking van een specifiek materiaal of molecule.
Bijvoorbeeld, #emph[halfgeleider] materialen leidden tot de transformatie van de gigantische mechanische computers in de jaren 50 naar de krachtige draagbare apparaten van vandaag,
en de ontdekking van #emph[penicilline] zorgde voor een revolutie in de geneeskunde als de
eerste effectieve behandeling tegen (dodelijke) bacteriën.
De huidige samenleving staat voor enorme uitdagingen, en we gaan waarschijnlijk gespecialiseerde materialen en moleculen nodig hebben om deze aan te pakken.
Gelukkig kunnen de eigenschappen van materialen en moleculen worden begrepen op basis van
de wetten van de kwantum- en statistische fysica, en dat maakt
het theoretisch mogelijk om ze te ontwerpen voor specifieke toepassingen.
Helaas is het aantal mogelijkheden ongelooflijk groot --
er bestaan ongeveer 94 natuurlijk voorkomende chemische elementen die op oneindig veel manieren kunnen worden gecombineerd --
en de vergelijkingen voor het voorspellen van hun
eigenschappen zijn veel te ingewikkeld om met de hand op te lossen.

Computersimulaties kunnen een haalbaar alternatief bieden.
Rekenkracht is sinds de jaren 70 bijna exponentieel gegroeid, en de huidige
supercomputers zouden ons in principe genoeg capaciteit kunnen bieden om de fysische en chemische
eigenschappen van moleculen en materialen te voorspellen.
Aldus moet het mogelijk zijn om een #emph[screening] uit te voeren over alle mogelijke
ruimtelijke composities van atomen, en bijvoorbeeld nieuwe materialen te vinden met
supergeleidend gedrag bij kamertemperatuur of nieuwe moleculen die zich specifiek binden
aan bepaalde eiwitten.
Eén van de belangrijkste uitdagingen in deze aanpak is de enorme computationele kost die
gepaard gaat met expliciete simulatie van de vergelijkingen van quantum- en statistische
mechanica.
In de afgelopen decennia hebben onderzoekers een zeer grote verscheidenheid aan
benaderende methoden ontwikkeld die kunnen worden gebruikt om een groot deel van de totale kosten te verlichten.
Desondanks bieden de huidige methoden nog niet de juiste balans tussen nauwkeurigheid en computationele efficiëntie:
methoden die chemische nauwkeurigheid bereiken
blijven te duur voor grootschalige screeningtoepassingen,
terwijl snellere benaderingen fouten introduceren die hun voorspellingen onbetrouwbaar maken.
Zelfs met de verwachte toename in rekenkracht in het komende decennium,
zou deze fundamentele beperking blijven bestaan.

Machine learning heeft zich recent gevestigd als een buitengewoon hulpmiddel voor wetenschappelijke
vooruitgang;
de Nobelprijzen voor zowel natuurkunde als scheikunde werden
in 2024 toegekend aan #emph[machine learning] wetenschappers.
Voor moleculaire simulatie in het bijzonder kan machine learning
simultaan de nauwkeurigheid _en_ de computationele efficiëntie met meerdere
grootteorden verbeteren.
Desalniettemin blijft het toepassen van machine learning methoden op complexe moleculaire
systemen bijzonder uitdagend.
Het hoofddoel van dit werk situeert zich in deze context, en beoogt om schaalbare machine
learning methoden te ontwikkelen die het computationeel onderzoek naar
chemische en fysische processen in nanogestructureerde
materialen kunnen versnellen en verbeteren,
met een specifieke focus op metaal-organische roosters en zeolieten vanwege
hun buitengewone eigenschappen in de context van gas adsorptie en katalyse.

Om dit te begrijpen, moeten we eerst onderzoeken wat moleculaire simulaties computationeel intensief maakt.
Op een abstract niveau kunnen dynamische simulaties worden gezien als een lange, herhalende reeks
stappen.
Elke stap vertegenwoordigt een enkele toepassing van de bewegingsvergelijkingen van Newton: we evalueren
de interatomaire krachten via kwantummechanische berekeningen en gebruiken deze om de atomaire posities over een zeer klein tijdsinterval
te propageren.
Door dit steeds te herhalen, simuleren we de dynamica van individuele atomen en kunnen we
hun fysische eigenschappen voorspellen.
De computationele uitdagingen in dergelijke simulaties zijn daarom tweeledig: hoe verminderen we de kosten van een enkele
dergelijke stap (d.w.z. de kwantummechanische evaluatie van de interatomaire krachten), en hoe verminderen we het totale
aantal stappen (d.w.z. de totale simulatietijd).
De belangrijkste bijdrage van het onderzoek in dit werk is de ontwikkeling van nieuwe machine
learning technieken die de state of the art voor beide uitdagingen vooruit helpen.

Voor de eerste uitdaging bouwen we voort op een groot aantal eerdere onderzoeken naar de toepassing
van machine learning op materialen en moleculen.
Een machine learning model beschouwt een materiaal of molecule als een driedimensionale
rangschikking van atomen (met of zonder periodiciteit),
en zijn taak is om de kwantummechanische interactie-energie
en de interatomaire krachten te voorspellen (zoals vereist voor dynamische simulaties).
Zulke modellen hebben uitstekende prestaties laten zien op benchmark datasets, maar hun
toepassing op nanoporeuze materialen was nog niet onderzocht.
De belangrijkste moeilijkheid heeft betrekking op het genereren van hoogwaardige trainingsdata die
de kwantummechanische energie en krachten bevatten die het model moet leren voorspellen.
Aan de ene kant kan het genereren van die trainingsdata zeer uitdagend zijn voor
metaal-organische frameworks en zeolieten vanwege hun chemische verscheidenheid en potentieel
metastabiel gedrag.
Aan de andere kant kunnen de meest accurate kwantummechanische methoden soms enkel de energie
berekenen en niet de interatomaire krachten, hoewel deze vereist zijn tijdens de training.
We pakken deze problemen aan met een combinatie van on-the-fly learning voor data generatie
en transfer learning om de noodzaak voor zeer nauwkeurige interatomaire krachten te omzeilen.

Voor de tweede uitdaging -- het verminderen van de totale simulatietijd -- laten we ons inspireren door
bestaande _rare event_ sampling algoritmen die vertrouwen op systeem-specifieke
kennis om de effectieve dynamica te versnellen zodat trage of zeldzame gebeurtenissen veel sneller
of frequenter plaatsvinden.
De belangrijkste bottleneck in deze benaderingen is de vereiste van een systeem-specifieke
reactiecoördinaat waarvan de definitie meestal gespecialiseerde kennis vereist en/of
een minimum aan menselijke trial and error.
We ontwikkelden een universele machine learning aanpak die de energievoorspellingsmodellen
aanvult met kennis over de zeldzame gebeurtenis op een manier die ons in staat stelt om reactiecoördinaten
voor chemische en fysische transformaties op een generieke manier te berekenen.
Bovendien demonstreren we door zorgvuldige overweging van de vereiste symmetrieën dat onze
methode het qua prestaties significant beter doet ten opzichte van alternatieven in de
literatuur.

We sluiten deze samenvatting af met een kort overzicht van het proefschrift.
Hoofdstukken 1 & 2 introduceren de fundamenten van moleculaire simulatie, en gaan meer in detail
over de tweeledige computationele uitdaging en traditionele benaderingen en technieken om
deze te overwinnen.
Hoofdstukken 3 & 4 bespreken de belangrijkste onderzoeksresultaten, waarbij Hoofdstuk 3 zich richt op de eerste
uitdaging met behulp van on-the-fly learning en transfer learning, en Hoofdstuk 4 zich richt op
het gericht versnellen van de dynamica.
Hoofdstuk 5 integreert de onderzoeksresultaten in 'psiflow': een softwarepakket voor
moleculaire simulaties dat het toelaat om deze technieken op grote supercomputers toe te
passen met minimale menselijke interventie.
Ten slotte formuleren we onze algemene conclusies en perspectieven voor toekomstig onderzoek in
Hoofdstuk 6.
]

#let paper1 = (
  number: "I",
  title: "Large-Scale Molecular Dynamics Simulations Reveal New Insights Into the Phase Transition Mechanisms in MIL-53(Al)",
  authors: "Sander Vandenhaute, Sven M. J. Rogge, Veronique Van Speybroeck",
  journal: [_Frontiers in Chemistry_, *2021*, _9_, 718920],
  contributor: "Sander Vandenhaute implemented and validated the anisotropic Monte Carlo barostat and performed all simulations.",
  copyright: "Copyright (2021), The Authors",
  num_pages: 24,
)
#let paper2 = (
  number: "II",
  title: "Large-Scale Molecular Dynamics Simulations Reveal New Insights Into the Phase Transition Mechanisms in MIL-53(Al)",
  authors: "Sander Vandenhaute, Sven M. J. Rogge, Veronique Van Speybroeck",
  journal: [_Frontiers in Chemistry_, *2021*, _9_, 718920],
  contributor: "Sander Vandenhaute implemented and validated the anisotropic Monte Carlo barostat and performed all simulations.",
  copyright: "Copyright (2021), The Authors",
  num_pages: 24,
)

#let publications = (
  (
    title: "Water motifs in zirconium metal-organic frameworks induced by nanoconfinement and hydrophilic adsorption sites",
  authors: [Aran Lamaire, Jelle Wieme, #underline[Sander Vandenhaute], Ruben Goeminne, Sven M. J. Rogge, Veronique Van Speybroeck],
    journal: [_Nature Communications_ (accepted), *2024*],
  ),
  (
    title: "The Operando Nature of Isobutene Adsorbed in Zeolite  H-SSZ-13 Unraveled by Machine Learning Potentials Beyond DFT  Accuracy",
  authors: [#underline[Sander Vandenhaute]#super[#sym.dagger], Massimo Bocus#super[#sym.dagger],
  Veronique Van Speybroeck #linebreak() #super[#sym.dagger]: these authors contributed
  equally],
    journal: [_Angewandte Chemie Int. Ed._ (accepted) e202413637, *2024*],
  )
)

#let presentations = (
  (
    title: "(invited) Pushing the Limits of Computational Chemistry",
    authors: [#underline[Sander Vandenhaute], Tom Braeckevelt, Veronique Van Speybroeck],
    event: "LUMI-BE User Day",
    date: "November 2024",
    location: "Charleroi, BE",
  ),
  (
    title: "Learned Rare Event Sampling at the Top of Jacob's Ladder",
    authors: [#underline[Sander Vandenhaute], Massimo Bocus, Veronique Van Speybroeck],
    event: "Advances in catalytic reactivity simulations under operando conditions",
    date: "October 2024",
    location: "Varigotti, IT",
  )
)


#let appendices = (
  (
    title: "Empirical Scaling of Quantum Chemistry Methods",
    body: [
This Section presents more details regarding the empirical scaling test as shown in
Figure 2.2. We use ORCA, a highly
optimized free but closed-source software package which implements a variety of very
powerful approximations @orca. Examples are the domain local pair natural
orbital localization method (DLPNO) for drastic improvements to the scaling of correlated
methods @riplingerdlpno, the chain of spheres (COSX) approximation for computing
Hartree-Fock exchange @neese2009,
and the resolution of identity (RI) approximation for faster evaluation of overlap
integrals @feyereisen.
While these are great approximations, it is critical to emphasize that they complicate the
evaluation of the gradients (i.e. the atomic forces) considerably. For example, ORCA 6 --
which has been released in 2024 -- still does not support the calculation of forces when using DLPNO
even though that approximation has been around for about a decade.
Given that the gradients of $E(bold(r))$ are required to integrate Newton's equation of motion through
time, the CCSD(T) and MP2 timings as reported in Figure 2.2 can not be considered as
realistic in the context of dynamic simulations where forces are required.
Finally, we should emphasize that many systems are not embedded in vacuum but apply
periodic boundary conditions (PBCs) in order to mimic the effect of bulk material.
While PBCs are not fundamentally incompatible with techniques such as RI or DLPNO, they
drive up the computational cost and overall complexity of the algorithms significantly
@bussy2024rihfx @ramberger2017 @bussy2023lowscaling.
As such, while correlated methods such as MP2 or CCSD(T) are feasible on isoluted clusters
of hundreds of atoms, the
same cannot be said for periodic systems.
The periodicity implicitly restricts the computational scaling of two-electron
integrals to at least cubic or even quartic with the number of atoms.
// Because PBCs are essential when modeling solids,
// hybrid DFT is, in many cases, the highest level of theory that is computationally feasible
// for those systems.

For Figure 2.2, we consider a cluster of water molecules of varying size, ranging from one
molecule to 31 molecules.
All calculations were performed on a single node, with 2x AMD EPYC Rome 7H12 and 512 GB
RAM. Each calculation was executed on four cores of an otherwise empty node to obtain
objective scaling information.
The following production-level input files were used:
- *PBE*:
  ```
  ! DFT PBE D3 cc-pVTZ def2-ECP TRAH VeryTightSCF DEFGRID3
  ```
- *PBE0*:
  ```
  ! DFT PBE0 D3 cc-pVTZ RIJCOSX def2-ECP TRAH VeryTightSCF DEFGRID3
  ```
- *DLPNO-MP2-F12*:
  ```
  ! RHF DLPNO-MP2-F12 cc-pVTZ-F12 cc-pVTZ-F12-CABS cc-pVTZ/C cc-pVTZ/JK RIJCOSX def2-ECP TRAH VeryTightSCF DEFGRID3
  %method
      RI on
  end
  %basis
      AuxJ "cc-pVTZ/JK"
  end
  ```
- *DLPNO-CCSD(T)-F12*:
  ```
  ! RHF DLPNO-CCSD(T)-F12 cc-pVTZ-F12 cc-pVTZ-F12-CABS RIJCOSX cc-pVTZ/JK cc-pVTZ/C def2-ECP TRAH VeryTightSCF DEFGRID3
  %method
      RI on
  end
  %basis
      AuxJ "cc-pVTZ/JK"
  end
  ```
See the ORCA manual for further information regarding the employed basis sets and
approximations.
  #pagebreak()
    ],
  ),
  (
    title: "Extended Hessian calculations",
    body: [
#align(center, text(fill: gray)[(adopted and modified with permission from paper 2)])
In voigt notation, the elasticity tensor $bold(C) in RR^(6 times 6)$
determines how the stress
$bold(sigma) in RR^6$ within the material changes
due to an applied strain $bold(epsilon.alt) in RR^6$:
$ bold(sigma) = bold(C) bold(epsilon.alt) $<stress_strain_def>
If we write the periodic box vectors of the system along the rows
of a unit cell matrix $bold(g) in RR^(3 times 3)$,
then the strain of a given atomic configuration may be computed as:
$ bold(epsilon.alt) = 1 / 2 (bold(g)_0^(-1) bold(g) bold(g)^T bold(g)_0^(-T) - 1) $
where $bold(g)_0$ is the optimized unit cell.
Conversely, a given strain $bold(epsilon.alt)$ may be converted into a target unit
cell $bold(g)$ using
$ bold(g) = bold(g)_0 sqrt(2 bold(epsilon.alt) + bold(1)) $
where the square root may be computed based on the eigenvalue decomposition of
$2 bold(epsilon.alt) + bold(1)$.
Each of the components of $bold(C)$ is determined by applying a series of
small strains, optimizing the positions while keeping the (strained) unit cell
fixed, and computing the observed stress.

For both the optimization as well as the stress computation, it helps to tighten
the SCF convergence bound to 10#super[-8] Ha.
In theory, it is possible to express the stiffness tensor at 0 K in terms of
second-order derivatives of the potential energy, thereby avoiding the need for
multiple optimizations or finite-difference approximations.
Because this expression is very ill-conditioned, it is not possible to use such
an expression for stiffness constants derived using either DFT or classical force
fields simply because second-order derivatives computed using finite-difference
schemes do not possess the required precision.
Neural network potentials on the other hand are often implemented using computational
frameworks which support automatic differentiation, and it is therefore possible
to compute higher-order derivatives at arbitrary precision.
This paragraph derives the expression for $bold(C)$ in terms of such derivatives of
the potential energy surface $E(bold(r), bold(g))$.
For convenience, we use regular indexing for the stress and strain tensors
as it is more convenient in this context.
In that case, @stress_strain_def is equivalent to the following expression
$ C_(i j k l) = (partial sigma_(i j)) / (partial epsilon.alt_(k l)) $
Alternatively, it can be written as the second-order derivative of the energy @Golesorkhtabar2013,
$ C_(i j k l) = 1 / V (partial^2 E) / (partial epsilon.alt_(i j) partial epsilon.alt_(k l)) $
using the fact that
$ sigma_(i j) = 1 / V (partial E) / (partial epsilon.alt_(i j)) $
where $V$ is the volume and the system is at its equilibrium at 0 K, i.e. $sigma_(i j) = 0$.
All the necessary information to compute those second-order derivatives is contained in
the #emph[extended] Hessian of the system:
#set math.mat(gap: 1em, delim: "[")
$ upright(H_(e x t) = mat(
  H_(f f), H_(f epsilon.alt);
  H_(epsilon.alt f), H_(epsilon.alt epsilon.alt);
)) $
where the submatrices, denoted by f and $epsilon.alt$, correspond respectively to the $3N$
fractional coordinates of the system and the 9 unit cell components.
Because first-order derivatives vanish at the equilibrium position, we have
for the second-order taylor expansion of the potential energy:
$ E = mat(bold(x)_upright(f)^T, bold(x)_epsilon.alt^T;)
  upright(mat(
  H_(f f), H_(f epsilon.alt);
  H_(epsilon.alt f), H_(epsilon.alt epsilon.alt);
))
  mat(bold(x)_upright(f); bold(x)_epsilon.alt)
$ <hessian_approx>
At constant strain $bold(x)_epsilon.alt$, the fractional coordinates $bold(x)_upright(f)$ which minimize the
energy $E$ can be found by setting the derivative of @hessian_approx to zero and solving
for $bold(x)_upright(f)$:
$ bold(x)_upright(f) = -upright(H_(f f)^(-1) H_(f epsilon.alt)) bold(x)_epsilon.alt $
If we substitute this back in @hessian_approx, we find
a relation between the total energy of the system for a given strain and at optimized coordinates:
$ E = bold(x)_epsilon.alt^T (upright(H)_(epsilon.alt epsilon.alt) -
  upright(H_(epsilon.alt f) H_(f f)^(-1) H_(f epsilon.alt))) bold(x)_epsilon.alt $
giving rise to the effective hessian:
$ upright(H_(e f f) = H_(epsilon.alt epsilon.alt) -
  H_(epsilon.alt f) H_(f f)^(-1) H_(f epsilon.alt)) $
such that the final stiffness constants are given by
$ C_(i j k l) = 1 / V (upright(H_(e f f)))_(i j, k l) $
// 	Instead of using the strain as an independent coordinate, one can also use the unit cell matrix $\vect{h}$ which represents the three periodic box vectors along the rows of a $3\times3$ matrix.
//     They are related as follows:\cite{Parrinello1982}
// 	\begin{equation}
// 		\vect{\epsilon} = \frac{1}{2} \left(\vect{h}_0^{-1} \vect{h} \vect{h}^\text{T} \vect{h}_0^{-\text{T}} - \text{I} \right)
// 	\end{equation}
// 	such that
// 	\begin{equation}
// 		\pd{}{\epsilon_{ij}} = \sum_\alpha h_{\alpha i} \pd{}{h_{\alpha j}}
// 	\end{equation}
// 	and
// 	\begin{equation}
// 		C_{ijkl} = \frac{1}{V} \sum_{\alpha \beta} h_{\alpha i} h_{\beta k} \left(\text{H}_\text{eff}\right)_{\alpha j,\beta l}
// 	\end{equation}
// 	where the effective Hessian in this equation is computed with respect to the fractional coordinates and cell components $h_{ij}$ instead of the strain components.
Numerically, this arguably more elegant approach will yield the same values for $bold(C)$
as obtained through the finite-difference scheme outlined above, provided
that the extended hessian is computed with sufficient accuracy.
This is the case for ML potentials due to the ability to perform automatic
differentiation for the total energy $E$ with respect to input coordinates $bold(r)$ and
box vectors $bold(g)$.
This is precisely how the ML predictions in Figure 3.7 were obtained.
DFT reference values were still obtained using the finite-difference approach
because energy derivatives obtained from DFT codes such as CP2K are too noisy.
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
      infrastructure in Europe through Regular and Extreme Scale Access
      projects (EHPC-REG-2023R02-152 and EHPC-EXT-2023E02-065)],
    [We acknowledge the Research Foundation - Flanders (FWO) for a doctoral fellowship (grant no.
  11H6821N)],
  ) + image("logos/VSC.png", width: 20em) + linebreak() + [We acknowledge VSC for their Tier1 infrastructure]

#show: book.with(
  title: [Accelerating Molecular Simulation using Machine Learning: From Wave Functions to Thermodynamics],
  author: "Sander Vandenhaute",
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

Materials and molecules, and collections of atoms in general, consist of electrons and nuclei
that interact electrostatically with each other.
Simulations of such systems may at first sight seem similar to large
cosmological simulations with stars and planets which interact through gravity
instead of electrostatics.
The crucial distinction is that electrons and nuclei are both incredibly small
(less than one nanometer in size) and many orders of magnitude lighter than stars and planets.
These fundamental differences lead to entirely different laws governing their behavior.
In this Chapter, we will briefly revise the basic physical concepts that are necessary to
simulate matter at the atomic scale, and conclude with an outlook on why computer simulations at this
scale are so challenging.
The goal is to give the reader an intuitive understanding of how the laws of physics can be
converted into practical simulation algorithms.
For a more rigorous and complete treatment of the material in this Chapter, we refer the reader to specialized
textbooks @landauquantum @landaustatistical @tuckerman2023.

// This Chapter presents a very brief and informal walkthrough of the most important
// concepts in modern physics that are relevant to this thesis. Most of the material is
// covered in either undergraduate or high school physics, chemistry, and/or mathematics
// courses.

== Electrons and Nuclei


The vast majority of empirical observations ever recorded by humankind can be understood
based on two key premises. First, materials and molecules are built from
_electrons_ and _nuclei_. Both the electron and the nucleus possess a few intrinsic
properties such as _charge_, _mass_, and _spin_. In particular, nuclei are relatively
heavy particles which possess a variable but positive charge. Electrons are more than
thousand times lighter than even the lightest nucleus, and they carry a fixed, negative charge.
Interestingly, electrons and nuclei can form groups with well-defined compositions; these
are referred to as _atoms_. The periodic table summarizes the frequently observed atoms




The second premise is that the behavior of electrons and nuclei through time is not just
completely random, but it obeys certain physical laws. The ones that are relevant in this
thesis are the laws of _quantum_ mechanics @landauquantum and _statistical_ mechanics
@landaustatistical.

== Quantum mechanics

Quantum mechanics dictates how electrons and nuclei interact with each other, and how
those interactions determine their behavior through time. The cornerstone is that
electrons and nuclei cannot be considered as infinitely small, point-like particles
with a well-defined position and velocity. Instead, quantum mechanics characterizes
particles using their _wave function_.
For all practical purposes, and for the
remainder of this thesis, the wave function of a single particle is a
scalar, dimensionless, and complex-valued function which maps any (three-dimensional)
spatial coordinate $bold(x) in RR^3$
into a complex number $psi(bold(x)) in CC$. The physical interpretation associated with $psi$ is
that it determines a probability density of observing the particle at any given location
in space. More specific, the probability of observing the particle at location $bold(x)$ in
space is proportional#footnote[
The typical wording in physics textbooks used in this context is that $|psi(bold(x))|^2 d
bold(x)$ encodes the probability of observing
the particle at an infinitesimal volume $[bold(x), bold(x) + d bold(x)]$.
Nevertheless, $|psi(bold(x))|^2$ is formally a continuous probability density function,
and its rigorous mathematical definition involves measure theory, which
is rather complicated and fully outside the scope of this thesis.]
to the modulus squared of the wave function, i.e. $|psi(bold(x))|^2$. In
particular, this implies that electrons (and to a lesser extent nuclei) can no longer be
localized into a particular point in space.

The time behavior of a particle is formalized by using a time-dependent wave function,
which is by convention denoted with a capital greek letter: $Psi(bold(x), t)$.
// In general, wave functions are , is fundamentally time-dependent, i.e.
// $psi(x) eq.delta Psi(x,t)$#footnote[By convention, time-dependent wave
// functions are denoted with a capital Greek letter].
The well-known _Schrödinger_ equation establishes a relationship
between the time evolution of the wave function $Psi(bold(x),t)$ and the particle's
_hamiltonian_ operator $hat(H)$ (the mathematical entity which encodes the kinetic and
potential energy of the particle) @landauquantum: $ i planck.reduce (partial Psi) /
(partial t) (bold(x), t) =
hat(H) Psi(bold(x), t) $<schrodinger>
In theory, we can solve @schrodinger to calculate the wave function $Psi(bold(x),t)$ of the
particle as a function of space and time, and compute the probability distribution
$|Psi(bold(x),t)|^2$ of actually observing the particle at any given position $bold(x)$ and time $t$.

// Without further assumptions, this is mathematically speaking a very hard problem.
// Fortunately, the Hamiltonian operator $hat(H)$ turns out to be time-independent (i.e.
// stationary) in the vast majority of cases, and that allows us to reformulate @schrodinger
// into an eigenvalue equation.
// // However, it is possible to reformulate @schrodinger
// // into an equivalent but _time-independent_ eigenvalue problem, and determine a set of linearly
// // independent and stationary eigenstates $psi_j eq.delta psi_j (r)$.
// In particular, it turns out that _any_ time-dependent wave function which satisfies @schrodinger
// can be expressed in terms of the time-independent _eigenstates_ $psi_j$ of the Hamiltonian:
// $ hat(H) psi_j (r) = E_j psi_j (r) quad j in NN quad quad arrow.r.long quad quad Psi(r, t)
// = sum_j c_j (t) psi_j (r) $<stationary>
// Note that the time dependence of $Psi(r, t)$ is fully contained in the (complex) expansion coefficients
// $c_j (t)$.
// For more details, we refer the reader to specialized textbooks @landauquantum.
// For the purpose of this thesis, it suffices to remember that solving @schrodinger is equivalent with
// solving @stationary.

As  demonstrates, electrons and nuclei agglomerate into atoms, and atoms are known to further
organize themselves into molecules and materials. Therefore, if we aim to predict the time
behavior of molecules and materials, we should be able to extend @schrodinger such that it
can deal with multiple electrons and multiple nuclei. Unsurprisingly, the wave function
for a system of $N$ particles depends on $3N$ spatial coordinates $bold(x)_1$,
$bold(x)_2$, ..., $bold(x)_N$ as well as time: $Psi(bold(x)_1, bold(x)_2, ..., bold(x)_N, t)$.
The hamiltonian $hat(H)$ of the system now contains the kinetic
energy of all $N$ particles as well as $O(N^2)$ interaction terms because of the charge each
particle carries.
While these electrostatic interactions between the positively charged nuclei and negatively
charged electrons are essential to the stability of the materials and molecules
around us, they also introduce a lot of complexity into @schrodinger.
In fact, @schrodinger is not analytically solvable for any system involving more than two
particles.
With the exception of an isolated hydrogen atom -- which is a two-particle
system -- it is necessary to develop and apply systematic approximations in order to calculate
the wave function of the system.

The physical #emph[ansatz] for the most important approximations in this thesis start from the observation that
electrons and nuclei are not just somewhat similar but oppositely charged particles; their
masses differ by over three orders of magnitude!
Inspired by this, Max Born and Robert Oppenheimer demonstrated that this large difference
in mass induces a time scale separation in @schrodinger @bornoppenheimer.
The most important consequence is that the many-particle wave function $Psi$ can actually be factorized into two
contributions: one coming from the lightweight, fast-moving electrons, and one from the
heavy, slowly-moving
nuclei.
Before we proceed, let us redefine our notation of the spatial coordinates of
the particles to emphasize the difference between electronic and nuclear
coordinates#footnote[In theory, the wave function $Psi$ also exhibits a dependence on
the intrinsic spin variables $sigma_i$ of each particle. In addition, because electrons are spin-$1/2$ particles,
the many-body wave function $Psi$ should satisfy the #emph[Pauli exclusion principle],
which states that two electrons can never occupy the same quantum state -- or alternatively that
the wave function $Psi$ is required to switch sign whenever two electrons are
interchanged. For the qualitative discussion in the present Chapter,
we choose to simplify the notation and omit the spin dependence of the wave function.]:
$ (bold(x)_1, bold(x)_2, ..., bold(x)_N) &=
(bold(r)_1, bold(r)_2, ..., bold(r)_m, bold(r)_e_1, bold(r)_e_2, ..., bold(r)_e_n) \
&= (bold(r), bold(r)_e) $
for a system with $m$ nuclei and $n$ electrons (and naturally $m + n = N$).
With this notation, we can express
#footnote[We implicitly assume that the electronic
eigenvalues in @electronicschrodinger are sufficiently separated, and that the electrons
occupy their ground-state energy level. This will always be the case in this thesis.]
the so-called Born-Oppenheimer approximation in the
context of this thesis as follows:
the full $N$-particle wave function $Psi(bold(r), bold(r)_e, t)$ can be written as a product
of a nuclear wave function $chi$ which depends on the spatial coordinates of the nuclei
$bold(r)$ and on the time $t$, and an electronic wave function $psi_e$ which depends explicitly on the
electron coordinates $bold(r)_e$ and implicitly on the nuclear coordinates
$bold(r)$ @atkins2011molecular @szabo1996modern:
$ Psi(bold(r), bold(r)_e, t) = psi_e (bold(r)_e | bold(r)) chi(bold(r), t) $<bo_wf>
The dynamic behavior of a system in the Born-Oppenheimer approximation is
therefore fully contained in the (time-dependent) nuclear wave function $chi$.
From the perspective of the electrons, the nuclei represent positive point charges
which are fixed or "clamped" in space at positions $bold(r)$.
The electrostatic interaction with the clamped nuclei is what causes the electronic wave function
to depend parametrically on the nuclear positions $bold(r)$.
The electronic Hamiltonian $hat(H)_e$ encodes the kinetic energy of all electrons as well
as the electron-electron and electron-nucleus interactions, and it defines the eigenvalue
equation which is used to calculate
#footnote[In many cases, there are infinitely many solutions, each of which has a
particular value for the eigenvalue $E$.
In the context of the Born-Oppenheimer approximation and this thesis, the relevant
solution is the _ground state_, i.e. the eigenstate with the lowest value for the energy $E$]
$psi_e$ @jensencomputational:
$ hat(H)_e psi_e (bold(r)_e | bold(r)) = E(bold(r)) psi_e (bold(r)_e | bold(r)) $ <electronicschrodinger>
The eigenvalue $E(bold(r))$ represents the electronic energy, and it naturally depends on
the nuclear coordinates as well.
Chapter 2 will go into more detail regarding the
practical solution of @electronicschrodinger.



Aside from the separation of the electronic and nuclear degrees of freedom,
there is a second important approximation that can be made here.
In general, experiments have shown that the degree to which particles exhibit quantum
mechanical behavior decreases with the mass of a particle.
#footnote[Fortunately, the theory of quantum mechanics supports these empirical observations;
@schrodinger and the associated wave function description approaches the
theory of classical mechanics in the limit of large masses --
this is an informal description of what is known as the Ehrenfest
theorem @landauquantum.]
Fortunately, it has been shown that for a large variety of physical properties and for all
but the lightest nuclei, we may
actually treat the dynamic behavior of nuclei in a classical manner, i.e. using the
familiar equations of classical mechanics
#footnote[For systems involving light nuclei such as hydrogen, the delocalized nature of
the nuclei can in fact influence their physical properties.
This influence becomes more pronounced at low temperatures.].
In this approach, the electrons are still treated quantum mechanically based on their
time-independent wave function $psi_e$ as it arises from the Born-Oppenheimer
approximation, but the nuclei are assumed to behave as classical point-like particles with
positions $bold(r)$, velocities $dot(bold(r))$, and accelerations $dot.double(bold(r))$.
The movement of the nuclei is determined by the quantum mechanical interaction energy
$E(bold(r))$ as defined by the electronic eigenvalue equation (@electronicschrodinger).
Effectively, $E(bold(r))$ represents a so-called #emph[Born-Oppenheimer] surface,
which functions as a potential energy surface that defines the time
evolution of the nuclei according to classical mechanics.

 summarizes our discussion thus far based on the most common substance in
the universe: water. It consists of three nuclei (with charges#footnote[In units of $e$,
the elementary unit of charge; $e=1.602176634 dot 10^(-19)$ Coulomb] +8, +1, and +1)
as well as 10 electrons (all of which have charge -1), or in terms of atoms: two hydrogens
and one oxygen.
According to @schrodinger, the dynamics of this system requires knowledge of the full
many-particle wavefunction $Psi(bold(r), bold(r)_e, t)$ as a function of the coordinates
of all nuclei $bold(r)=(bold(r)_1, bold(r)_2, bold(r)_3)$ (for oxygen and the two
hydrogens), the electrons
$bold(r)_e=(bold(r)_e_1,bold(r)_e_2, ...,
bold(r)_e_(10))$, and time -- which sums up to $13 times 3 + 1 = 40$ dimensions.
Combining the Born-Oppenheimer time scale separation in @bo_wf and a classical
approximation of the atomic nuclei, the dynamic behavior of the entire system can be
simplified into an equivalent _classical_ system in which the atomic nuclei are subject to
an effective interaction potential $E(bold(r))$ which contains the quantum mechanical effects of
the electrons @bornoppenheimer.
As stated in @electronicschrodinger, this interaction potential $E(bold(r))$ is defined as
the smallest eigenvalue of @electronicschrodinger, and it is a smooth function of the
nuclear coordinates $bold(r)$.
// Unless otherwise specified, we adopt the notation from the Course of Theoretical
// Physics, Volume III by Lev Landau#footnote[Lev Davidovich Landau (1908 -- 1968); he was
// awarded the Nobel prize in physics in 1962.] @landauquantum which drops the dependence on the spatial coordinates
// for brevity.
// As such, @electronicschrodinger defines a classical interaction potential -- or
// _Born-Oppenheimer surface_ -- $E(bold(r))$
// which determines the dynamics of the nuclei based on the well-known classical equations of
// motion.
In particular, the gradient of the interaction energy defines a set of forces on
the atomic nuclei, which can be inserted into Newton's second law in order to obtain
the resulting acceleration:
$ - nabla_bold(r) E = m dot.double(bold(r)) $<bo_dynamics>
in which $dot.double(bold(r))$ represents the acceleration as the second derivative of the
nuclei positions with respect to time.
In this sense, the time behavior of a system of electrons and nuclei is not terribly
different from, say, a system of stars in the galaxy.
// While the Born-Oppenheimer approximation -- and Equations 2 & 3 --
// are generally valid in the context of this thesis, it should be noted that this is not
// always the case @Nelson2020.

While the Born-Oppenheimer picture in  is a useful and intuitive point of view, it is by no means sufficient to help
us understand why ice melts and why steel becomes more brittle with increasing fractions of
carbon to iron.
Typical experiments in physics and chemistry do not deal with just one atom, but with an
enormously large number of atoms -- on the order of Avogadro's number, i.e. $10^23$.
Brute force solution of either @schrodinger or the Born-Oppenheimer equivalent
is and always will be completely intractable due to the inconceivably large
number of atoms in any experimental setup.
Even though the microscopic laws which govern the behavior of electrons and nuclei are now
known, it is still completely unclear how we can
ever apply them to understand empirical observations at the macroscopic level.

Let us first reflect on how typical scientific experiments are performed @frenkelsmit.
Samples are prepared according to a well-defined procedure; its environment is carefully
controlled; and the property of interest is measured over some finite interval of time.
Typically, the experiment is repeated multiple times, and the final value is taken as the
mean of all individual measurements, with a standard error defined by the variation between each
measurement.
Even if we could somehow predict the behavior of
$10^23$ particles by solving @electronicschrodinger and mapping each of their trajectories
in space and time, how would we compare this theoretical prediction with
the outcome of such an experiment?
There is no experimental technique which allows us to measure the simultaneous position
and velocity of every atom, so the outcome of our incredibly expensive simulations
can not even be validated even if we could perform them.
// The laws of quantum mechanics and Newtonian mechanics are microscopic, and they have no
// notion of macroscopic control variables such as temperature or pressure.
// Even if we can somehow incorporate those effects into the microscopic behavior of the
// atoms,

This is where _statistical mechanics_ comes into play @landaustatistical @frenkelsmit.

== Statistical mechanics

Statistical mechanics and thermodynamics are based on real experiments.
As mentioned before, real experiments require the preparation of some sample, immerse it
in a controlled environment, and measure some property of interest over a sufficiently
long time interval.
In an analogous but more abstract fashion, statistical mechanics partitions
the universe into a _system_ and its _surroundings_ @landaustatistical.
In line with a classical approximation of the dynamics of atomic nuclei, the state of the system
is defined by the positions and velocities of the nuclei at any given instant.
In line with real experiments,
the state of the surroundings is only known in a macroscopic sense, i.e. based on
macroscopic variables such as temperature or pressure.
The system and its surroundings may interact with each other; the surroundings might transfer heat into
the system, or impose a mechanical force (and vice-versa).
In this setup, neither quantum nor classical mechanics can help us in deducing properties
regarding the system, because the precise behavior of the atoms in the surroundings is not really known.
The goal of statistical mechanics is to determine the _statistical_ behavior of the atoms
in the system as a function
of the macroscopic variables which characterize the environment.
The adjective "statistical" refers to the fact that we do not aim to predict the precise
movement of each and every atom.
Instead, we aim to understand and predict the _probability_ of observing the system in a
particular #emph[configuration], which is defined by the set of atomic positions $bold(r)$ and
velocities $bold(v)$ #footnote[We employ $bold(v)$ and no longer $dot(bold(r))$ because in
statistical mechanics, positions and velocities are treated as independent variables].
// #footnote[Technically, the state of the system is characterized by its positions $bold(r)$
// _and_ velocities $dot(bold(r))$. The velocity dependence is typically treated separately
// and is not relevant in the remainder of this Chapter, so we choose to omit it for brevity.]
Formally, this distribution is characterized by a probability density $p(bold(r), bold(v))$,
the specifics of which depend on how the system and the environment interact with each
other as in 
Let us briefly discuss three important types of ensembles:


- *isolated*: the system is entirely isolated from its environment.
  With respect to , we can say that there is no exchange of atoms, no
  exchange of energy, and no exchange of system volume between the system and its
  environment.
  In that case, the number of atoms $cal(N)$, the total volume $cal(V)$,
  and the total (potential and kinetic) energy $cal(E)$ of the system remain constant.
  Because there is no interaction between the system and its environment,
  we can use the familiar equations of classical
  mechanics to fully describe its time behavior.
  According to Liouville's theorem, for such a system, every state $(bold(r), bold(v))$
  which is energetically accessible is equally likely
  @gibbs1902:
  $ p(bold(r), bold(v)) prop delta(cal(E) - E(bold(r)) - K(bold(v))) $
  with $E(bold(r))$ the quantum mechanical interaction energy as resulting from
  @electronicschrodinger, $K(bold(v))$ the kinetic energy of all atoms, and $delta$ the
  Dirac distribution. This ensemble is commonly referred to as the microcanonical
  ensemble, and can be denoted as $(N,V,cal(E))$.
- *thermal equilibrium*: the most common scenario; the system is in thermal equilibrium
  with its environment, at some temperature $T$. This implies that there is energy flowing between the system and
  its environment. In this scenario, it is possible to simplify our discussion and
  consider the probability distribution as a function of the positions $bold(r)$
  only, not the velocities#footnote[In this case, the velocity dependence can be shown to
  result in an overall factor which is otherwise irrelevant to the discussion in the
  present Chapter.] $bold(v)$:
  $ p(bold(r)) prop e^(-beta E(bold(r))) $<canonical>
  with $beta = (k T)^(-1)$ and $k$ the familiar Boltzmann's constant.
  The interpretation of @canonical is that states $bold(r)$ with lower energy are
  exponentially more likely than states with higher energy, but no state is fundamentally
  inaccessible. This ensemble is commonly denoted by $(N, V, T)$.
- *thermal and mechanical equilibrium*: a common scenario in materials science; the system
  is in thermal and mechanical equilibrium with its environment, as characterized by a
  temperature $T$ and a (hydrostatic) pressure $P$.
  As for the isothermal case, we can ignore the velocity dependence and simply consider
  the configurational probability distribution:
  $ p(bold(r)) prop e^(-beta E(bold(r))) e^( - beta P V) $<npt>
  This ensemble is commonly denoted by $(N, P, T)$.

For rigorous proofs of these expressions, we refer to reader to e.g. Ref @tuckerman2023.
The research in this thesis only ever employs the constant temperature ensembles
(@canonical and @npt), and we use a single notation $p(bold(r))$ to denote the
(configurational part of the) ensemble probability density in both cases.
Note that the probability density always contains a dependence on the interaction
potential $E(bold(r))$ which, in the Born-Oppenheimer approximation, represents the
electronic energy as computed from @electronicschrodinger.

The foundation of statistical mechanics is that --
similar to real experiments which perform $n$ measurements of a property of interest and
compute its average -- the
value of a particular observable $A$ is defined as an average of its local value $A(bold(r))$
over the ensemble probability density:
// For example, if we wish to predict the heat capacity of the system (the ability to store
// energy per unit of temperature), we would have to compute the average energy of the system
// as a function of temperature @tuckerman2023:
// $ angle.l E angle.r = integral e^(- beta E(bold(r))) E(bold(r)) d bold(r) $
// and then compute its derivative with respect to temperature:
// $ c_v = (d angle.l E angle.r) / (d T) $

Let us summarize our discussion thus far.
Quantum and classical mechanics define the
microscopic laws which govern the behavior of an isolated system of atoms.
Because experimental measurements rarely ever involve a fully isolated system,
it is necessary to extend the microscopic laws with a formalism that allows us to treat
systems in equilibrium with their surroundings ().
The value of a physical observable is then defined as an average of its instantaneous
value over the statistical distribution function of the system.
This combination of quantum mechanics and statistical mechanics is incredibly powerful,
and it provides the foundation for the remainder of this thesis.
It allows us to write down specific equations for pretty much any experimentally
measurable quantity.
Unfortunately, that's about it; it allows us to write these equations down, not solve them.
// This is perhaps the part where the theoretical chemist or physicist considers it a job well done,
// but the engineer remains dissatisfied; we are still nowhere close to predicting the
// behavior of electrons and nuclei in everyday life.



== Molecular simulation
<molecularsimulation>
The equations of quantum and statistical mechanics can almost never be solved
using analytic methods.

Last
#pagebreak(to: "odd")

