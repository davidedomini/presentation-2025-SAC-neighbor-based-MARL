#import "@preview/touying:0.5.2": *
#import themes.metropolis: *
#import "@preview/fontawesome:0.1.0": *
// #import "@preview/ctheorems:1.1.2": *
#import "@preview/numbly:0.1.0": numbly

// Pdfpc configuration
// typst query --root . ./example.typ --field value --one "<pdfpc-file>" > ./example.pdfpc
#let pdfpc-config = pdfpc.config(
    duration-minutes: 30,
    start-time: datetime(hour: 14, minute: 10, second: 0),
    end-time: datetime(hour: 14, minute: 40, second: 0),
    last-minutes: 5,
    note-font-size: 12,
    disable-markdown: false,
    default-transition: (
      type: "push",
      duration-seconds: 2,
      angle: ltr,
      alignment: "vertical",
      direction: "inward",
    ),
  )

// Theorems configuration by ctheorems
// #show: thmrules.with(qed-symbol: $square$)
// #let theorem = thmbox("theorem", "Theorem", fill: rgb("#eeffee"))
// #let corollary = thmplain(
//   "corollary",
//   "Corollary",
//   base: "theorem",
//   titlefmt: strong
// )
// #let definition = thmbox("definition", "Definition", inset: (x: 1.2em, top: 1em))
// #let example = thmplain("example", "Example").with(numbering: none)
// #let proof = thmproof("proof", "Proof")

#let mail(email) = {
  text(size: 1.2em)[#raw(email)]
}
#let authors = block[
  #table(
    inset: (0em, 0.5em), stroke: none, columns: (auto, 4fr), align: (left, left),
    [*Davide Domini*], [#mail("davide.domini@unibo.it")],
    // [Mirko Viroli], [#mail("mirko.viroli@unibo.it")],
    // [Roberto Casadei], [#mail("roby.casadei@unibo.it")],
  )
  #place(right, dy: 2.5em)[
    #figure(image("images/disi.svg", width: 40%))
  ]
]

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-common(
    // handout: true,
    preamble: pdfpc-config, 
  ),
  config-info(
    title: [Title],
    subtitle: [Subtitle],
    author: authors,
    date: datetime.today(),
    institution: [Institution],
    // logo: emoji.school,
  ),
)

#set text(font: "Fira Sans", weight: "light", size: 20pt)
#show math.equation: set text(font: "Fira Math")

// #set heading(numbering: numbly("{1}.", default: "1.1"))

#title-slide()

// == Outline <touying:hidden>

// #components.adaptive-columns(outline(title: none, indent: 1em))

// = Animation

// == Simple Animation

#pdfpc.speaker-note("This is a note that only the speaker will see.")

