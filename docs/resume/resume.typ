#set page(
  paper: "a4",
  margin: (x: 0.5in, y: 0.6in),
  // background: image("resume-background.svg", fit: "contain", width: 100%),
)

#set text(
  font: "EB Garamond",
  size: 11pt,
  hyphenate: false,
)

#set par(
  leading: 0.55em,
  justify: true,
)

#show link: underline

#let rot5(text) = {
  let map = (
    "0": "5", "1": "6", "2": "7", "3": "8", "4": "9",
    "5": "0", "6": "1", "7": "2", "8": "3", "9": "4",
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
  block(width: 100%, breakable: true)[
    #grid(
      columns: (1fr, auto),
      gutter: 0.55em,
      [#strong(company)], align(right)[*#tenure_start -- #tenure_end*],
      [#emph(designation)], align(right)[#location],
    )
    #v(4pt)
    #content
  ]
}

#let education(school, course, tenure_start, tenure_end) = {
  block(width: 100%, breakable: true)[
    #grid(
      columns: (1fr, auto),
      gutter: 0.55em,
      [#strong(school)], align(right)[*#tenure_start -- #tenure_end*],
      [#emph(course)], [],
    )
  ]
}

#let project(name, link_url, description) = {
  block(width: 100%, breakable: true)[
    *#name* #if link_url != "" [ #h(1em) #link(link_url) ] \
    #description
  ]
}

#grid(
  columns: (1fr, 1.5fr),
  align(left)[
    #text(size: 20pt, weight: "semibold", tracking: -0.5pt)[Pranav Karawale]\
    #text(size: 11pt, fill: accent)[Precision _beyond_ pixels.]
  ],
  align(right + horizon)[
    #link("mailto:" + email)[#email] | #phone | #location \
    #link(website)[karawale.com] | #link(github)[github.com/retronav] | #link(linkedin)[linkedin.com/in/pranavkarawale]
  ],
)
#v(6pt)

#show table.cell.where(x: 0): it => {
  set text(weight: "bold", fill: accent, size: 10pt)
  upper(it)
}
#table(
  columns: (1.3fr, 5fr),
  inset: (x: 0pt, y: 10pt),
  stroke: (x: none, y: 0.8pt + accent),
  align: (x, y) => left + top,

  [Summary],
  [Founding Engineer and CS student building edge-deployed IoT pipelines and applied ML systems for industrial clients. Proven track record of scaling consumer applications and optimizing cloud infrastructure.],

  [Skills],
  grid(
    columns: (1fr, 1fr),
    gutter: 8pt,
    [
      *Languages:* Python, TypeScript, Go, C, Bash\
      *Backend:* Node.js, FastAPI, PostgreSQL, MongoDB, MQTT, GRPC
    ],
    [
      *Infra & DevOps:* AWS (EC2, S3), Docker, Traefik, Grafana, Prometheus\
      *AI & Edge:* YOLO, OpenCV, Raspberry Pi, STM32, Modbus/PLC, PlatformIO
    ],
  ),

  [Experience],
  stack(
    spacing: 14pt,
    experience(
      link("https://pravideon.com")[Pravideon Pvt Ltd],
      "Founding Engineer",
      "Jan. 2024",
      "Present",
      "Navi Mumbai, India",
      [
        - Worked on designing AI models and controls for industrial fire monitors to detect and respond to fire hazards autonomously. Collaborated with stakeholders to build a secure, real-time remote monitoring dashboard.
        - Built live data pipeline using Python and PostgreSQL, indexing 15 million+ historical records in under 24 hours, and ingesting daily new data.
        - Developed real-time IoT monitoring dashboard deployed across 10+ industrial sites, achieving 99.9% uptime.
        - Created AWS-hosted ingestion pipeline processing and indexing 200K+ rich-media questions for enterprise LMS.
      ],
    ),
    experience(
      "Avignon Université",
      "Research Intern",
      "Jun. 2025",
      "Aug. 2025",
      "Avignon, France",
      [
        Designed new authenticated encryption with associated data encapsulation scheme for LoRaWAN for protection against various MiTM, replay attacks, and developed vector database based reinforcement learning for auditing end devices.
      ],
    ),
    experience(
      "Freelancing",
      "AI Tooling Engineer",
      "Apr. 2023",
      "Dec. 2023",
      "Remote",
      [
        Architected a LLM agnostic prompt orchestration framework utilizing React JSX as a declarative language to build, manage, and scale complex agentic workflows across different LLM providers (OpenAI, Anthropic, Gemini).
      ],
    ),
  ),

  [Education],
  education(
    "Vishwaniketan's iMEET (University of Mumbai)",
    "B.E. Computer Engineering",
    "Nov. 2022",
    "Jun. 2026",
  ),

  [Projects],
  stack(
    spacing: 12pt,
    project(
      "Newage Fire AI",
      "",
      "Autonomous Fire detection and response system. Uses Modbus and custom trained models to target and extinguish fires using industrial monitors, and send live alerts.",
    ),
    project(
      "Ixora",
      "http://github.com/retronav/ixora",
      "An extension pack to make interactive WYSIWYG markdown editors using CodeMirror 6.",
    ),
    project(
      "DuckThisFile",
      "",
      "Self-hosted file portal with microservice architecture for image and PDF processing with privacy.",
    ),
  ),

  [Achievements],
  [
    *Winner:* Echelon '25 Hackathon (AI P&ID Digitization)\
    *Gold Medallist:* JuniorSkills India 2021 (Web Technologies - National Level)\
    *Leadership:* Mentored peers & led technical workshops as Technical Lead, GDG on Campus ViMEET (2024-25).\
    *OSS Contributor:* Astro [https://astro.build]
  ],
)
