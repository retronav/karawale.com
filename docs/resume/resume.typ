#set page(
  paper: "a4",
  margin: (x: 0.5in, y: 0.5in),
)

#set text(
  font: "New Computer Modern",
  size: 11pt,
  hyphenate: false,
)

#set par(
  leading: 0.6em,
  justify: true,
)

#show link: underline

#let rot5(text) = {
  let map = (
    "0": "5",
    "1": "6",
    "2": "7",
    "3": "8",
    "4": "9",
    "5": "0",
    "6": "1",
    "7": "2",
    "8": "3",
    "9": "4",
  )
  text.split("").map(c => map.at(c, default: c)).join("")
}

#let accent = rgb("#4541B4")
#let email = "pranav@karawale.com"
#let phone = rot5("+46 31506 94774")
#let location = "Navi Mumbai, IN"
#let website = "https://karawale.com"
#let github = "https://github.com/retronav"
#let linkedin = "https://www.linkedin.com/in/pranavkarawale"

#let experience(company, designation, tenure_start, tenure_end, location, content) = {
  block(width: 100%, breakable: false)[
    #grid(
      columns: (1fr, auto),
      gutter: 0.55em,
      [#text(size: 12pt, weight: "bold")[#company]], align(right)[#tenure_start -- #tenure_end],
      [#emph(designation)], align(right)[#location],
    )
    #v(4pt)
    #content
  ]
}

#let education(school, course, tenure_start, tenure_end, cgpa) = {
  block(width: 100%, breakable: false)[
    #grid(
      columns: (1fr, auto),
      gutter: 0.55em,
      [#text(size: 12pt, weight: "bold")[#school]], align(right)[#tenure_start -- #tenure_end],
      [#emph(course)], [CGPA: #cgpa],
    )
  ]
}

#let project(name, link_url, description) = {
  block(width: 100%, breakable: false)[
    #text(size: 12pt, weight: "bold")[#name] #if link_url != "" [ #h(1em) #link(link_url) ] \
    #description
  ]
}

#grid(
  columns: (1fr, 1.5fr, 1fr),
  align(left)[
    #text(size: 10pt)[#link(github)[github.com/retronav]]\
    #text(size: 10pt)[#link(linkedin)[linkedin.com/in/pranavkarawale]]
  ],
  align(center)[
    #text(size: 26pt, weight: "medium", tracking: -0.5pt)[Pranav Karawale]\
    #link(website)[karawale.com]
  ],
  align(right)[
    #link("mailto:" + email)[#email]\
    #phone\
    Navi Mumbai, IN
  ],
)
#v(6pt)

#show table.cell.where(x: 0): it => {
  set text(weight: "bold", fill: accent, size: 10pt)
  upper(it)
}

#table(
  columns: (1.2fr, 5fr),
  inset: (x: 0pt, y: 9pt),
  stroke: (x: none, y: 0.25pt + accent),
  align: (x, y) => left + top,

  [Education],
  education(
    "Vishwaniketan's iMEET (University of Mumbai)",
    "B.E. Computer Engineering",
    "2022",
    "2026",
    "7.90 / 10",
  ),

  [Experience],
  stack(
    spacing: 12pt,
    experience(
      link("https://pravideon.com")[Pravideon Pvt Ltd],
      "Full Stack Developer",
      "October 2024",
      "Present",
      "Navi Mumbai, India",
      [
        - Engineered a multi-tenant Next.js dashboard and a Python backend featuring real-time WebRTC streaming, and deployed the containerized Docker architecture on AWS to enable 24/7 remote management of an autonomous fire suppression system.
        - Overhauled a legacy platform by building a Node.js pipeline that continuously ingested MQTT telemetry from 10+ hardware sites into a PostgreSQL database for robust data aggregation and automated Amazon SES alerts.
        - Built a custom multi-tenant SaaS platform using React, TypeScript, and Laravel that digitized manual notebook operations, and trained non-technical employees across 5+ gas agencies to efficiently track inventory and daily delivery logistics.
      ],
    ),
    experience(
      "Avignon Université",
      "Research Intern",
      "June 2025",
      "July 2025",
      "Avignon, France",
      [
        - Designed a zero-overhead cryptographic encapsulation scheme for LoRaWAN using ChaCha20-Poly1305 AEAD, implemented on ESP32 microcontrollers to secure IoT communications against spoofing and replay attacks without altering existing network infrastructure.
      ],
    ),
    experience(
      "Freelancing",
      "Freelance Software Engineer",
      "April 2023",
      "December 2023",
      "Remote",
      [
        - Developed a Node.js and TypeScript orchestration framework utilizing React JSX and OpenAI APIs to programmatically define agentic workflows, establishing the core backend logic for a future no-code platform.
      ],
    ),
  ),

  [Skills],
  grid(
    columns: 1fr,
    gutter: 8pt,
    [
      *Languages:* TypeScript, JavaScript, Python, Go, PHP, C\
      *Frontend:* Next.js, React, Svelte, HTML5, CSS3
    ],
    [
      *Backend:* Node.js, Flask, FastAPI, Laravel, PostgreSQL, MongoDB\
      *DevOps:* AWS (EC2, SES, Lightsail), Docker, MQTT, WebRTC, Git
    ],
  ),

  [Projects],
  stack(
    spacing: 10pt,
    project(
      "Bratify",
      "https://bratify.vercel.app",
      "Interactive Svelte image generator that organically scaled to over 30,000 monthly active users.",
    ),
    project(
      "DuckThisFile",
      "",
      "Self-hosted file portal for secure, privacy-focused image and PDF processing built using microservice architecture.",
    ),
    project(
      "Ixora",
      "https://github.com/retronav/ixora",
      "A TypeScript extension pack for interactive WYSIWYG markdown editing using CodeMirror 6.",
    ),
  ),

  [Achievements],
  [
    *Hackathon Winner:* Echelon '25 (AI P&ID Digitization)\
    *Gold Medallist:* JuniorSkills India 2021 (Web Technologies --- National Level)\
    *Technical Lead:* GDG on Campus ViMEET (2024-25); mentored peers and directed technical workshops.\
    *OSS Contributor:* #link("https://github.com/withastro/astro/issues?q=author%3A%40retronav", "Astro (astro.build)")
  ],
)
