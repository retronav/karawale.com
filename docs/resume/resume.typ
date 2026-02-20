#set page(
  paper: "a4",
  margin: (x: 0.5in, y: 0.6in),
  background: image("resume-background.svg", fit: "contain", width: 100%),
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

#let accent = rgb("#4541B4")
#let email = "pranav@karawale.com"
#let phone = "+91 XXXXX XXXXX"
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
  columns: (1fr, 1.2fr),
  align(left)[
    #text(size: 20pt, weight: "semibold", tracking: -0.5pt)[Pranav Karawale]\
    #text(size: 11pt, fill: accent)[Precision _beyond_ pixels.]
  ],
  align(right + horizon)[
    #link("mailto:" + email)[#email] | #phone | #location \
    #link(website)[karawale.com] | #link(github)[github.com/retronav] | #link(linkedin)[linkedin/in/pranavkarawale]
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
      *Backend:* Node.js, FastAPI, PostgreSQL, MongoDB, MQTT
    ],
    [
      *Infra & DevOps:* AWS (EC2, S3), Docker, Traefik, Grafana\
      *AI & Edge:* YOLO, OpenCV, Raspberry Pi, STM32, Modbus/PLC
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
        - Deployed custom YOLO vision model (0.77 mAP\@50) on edge hardware, integrated with PLCs via Modbus for real-time fire monitor pump control.
        - Built Node.js and PostgreSQL metadata aggregator indexing 15M+ records in under 24 hours.
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
        - Developed LoRaPWN, a MAC-layer security enhancement using ChaCha20-Poly1305 cryptography for LoRaWAN.
        - Designed STM32 hardware testbed, achieving 10x cryptographic throughput increase and 90% energy reduction vs standard AES.
        - Co-authored research on architecture and energy benchmarks for IEEE submission.
      ],
    ),
    experience(
      "Freelancing",
      "AI Tooling Engineer",
      "Apr. 2023",
      "Dec. 2023",
      "Remote",
      [
        - Built custom LLM orchestration framework using React JSX as a declarative prompt-structuring syntax.
        - Architected cross-model abstraction layer supporting multi-provider tool calling (OpenAI, Anthropic, Gemini).
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
      "Bratify",
      "https://bratify.vercel.app",
      "Interactive Svelte image generator scaled to 30K MAU; achieved perfect Lighthouse scores via optimized rendering.",
    ),
    project(
      "Aetherline",
      "",
      "AI digitization engine for P&ID diagrams utilizing Python, OpenCV, and YOLO.",
    ),
    project(
      "AccessEye",
      "",
      "Automated ALPR and entry-management system with <700ms inference on Raspberry Pi Zero 2 W.",
    ),
  ),

  [Achievements],
  [
    *Winner:* Echelon '25 Hackathon (AI P&ID Digitization)\
    *Gold Medallist:* JuniorSkills India 2021 (Web Technologies - National Level)\
    *Leadership:* Technical Lead, GDG on Campus VIMEET (2024-25)\
    *OSS Contributor:* Astro [https://astro.build]
  ],
)
