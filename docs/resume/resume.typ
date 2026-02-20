#set page(
  paper: "a4",
  margin: 0.5in,
  background: image("resume-background.svg", fit: "contain", width: 100%),
)

#set text(
  font: "EB Garamond",
  size: 11pt,
)

#set par(
  leading: 0.45em,
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
  grid(
    columns: (1fr, 1fr),
    gutter: 4pt,
    [== #company], align(right)[*#tenure_start -- #tenure_end*],
    emph([#designation]), align(right)[#location],
  )
  [#content]
}

#let education(school, course, tenure_start, tenure_end) = {
  grid(
    columns: (1fr, 1fr),
    gutter: 4pt,
    [== #school], align(right)[*#tenure_start -- #tenure_end*],
    emph([#course]),
  )
}

#let project(name, description) = {
  show heading.where(level: 2): it => strong(it.body) + [ ]
  [
    == #name
    #description
  ]
}

#grid(
  columns: (1fr, 2fr),
  gutter: 4pt,

  stack(
    spacing: 4pt,
    text(size: 24pt, weight: "semibold", tracking: -1pt)[Pranav Karawale],
    text(size: 12pt, weight: "medium", fill: accent)[Precision _beyond_ pixels.],
  ),

  align(right)[
    #link("mailto:" + email)[#email] | #phone \
    #location | #link(website)[karawale.com] | #link(github)[#github] \
    #link(linkedin)[#linkedin]
  ],
)

#show table.cell.where(x: 0): it => {
  set text(weight: "bold", fill: accent)
  upper(it)
}

#table(
  columns: (1fr, 4fr),
  inset: (x: 0pt, y: 6pt),
  stroke: (x: none, y: 1.2pt + accent),

  [Summary],
  [Founding Engineer & final-year CS student with production experience building edge-deployed IoT pipelines and applied ML systems for industrial clients. Scaled a consumer app to 30k+ MAU.],

  [Skills],
  grid(
    columns: (1fr, 1fr),
    gutter: 4pt,
    [
      *Languages:* Python, TypeScript, Go, C, Bash\
      *Backend:* Node.js, FastAPI, PostgreSQL, MongoDB, MQTT\
    ],
    [
      *Infra & DevOps:* AWS (EC2, S3), Docker, Traefik, Prometheus/Grafana\
      *AI & Vision:* YOLO, OpenCV, TensorFlow\
      *IoT & Embedded:* Raspberry Pi, LoRaWAN, STM32, Modbus/PLC\
    ],
  ),

  [Experience],
  stack(
    spacing: 6pt,
    experience(
      link("https://pravideon.com")[Pravideon Pvt Ltd],
      "Founding Engineer",
      "Jan. 2024",
      "Present",
      "Navi Mumbai, India",
      [
        - Deployed a custom YOLO vision model (0.77 mAP\@50) on edge hardware; integrated with PLCs via Modbus to auto-target and control fire monitor pumps in real-time.
        - Built a metadata aggregator service (Node.js, PostgreSQL) that indexed 15M+ records in under 24 hours, redesigning the pipeline to sustain continuous throughput from live data records.
        - Developed a real-time IoT monitoring dashboard (Next.js, MQTT, PostgreSQL) deployed across 10+ industrial sites; achieved 99.9% uptime with automated threshold alerting for water, fire, and safety systems.
        - Developed an AWS-hosted enterprise LMS for coaching institutes, building an ingestion pipeline that processed, tagged, and indexed 200K+ rich-media questions (text, images, LaTeX).
      ],
    ),
    experience(
      "Avignon Université",
      "Research Intern",
      "Jun. 2025",
      "Aug. 2025",
      "Avignon, France",
      [
        - Developed LoRaPWN, a novel MAC-layer security enhancement for LoRaWAN, integrating ChaCha20-Poly1305 AEAD cryptography to secure IoT communications.
        - Designed and benched an STM32 hardware testbed, achieving a 10x increase in cryptographic throughput and a 90% reduction in energy consumption vs standard AES implementations.
        - Co-authored research detailing the LoRaPWN architecture and energy-efficiency benchmarks (manuscript in preparation for IEEE conference submission).
      ],
    ),
    experience(
      "Freelancing",
      "AI Tooling Engineer",
      "Apr. 2023",
      "Dec. 2023",
      "Remote",
      [
        - Built a custom LLM orchestration framework using React JSX as a declarative prompt-structuring syntax, supporting multi-provider tool calling across OpenAI, Anthropic, and Gemini.
        - Architected the core abstraction layer for cross-model compatibility, establishing the foundation for a client's internal AI workflow tooling.
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
    spacing: 6pt,
    project(
      "Bratify",
      [Built an interactive image generator (Svelte) that organically grew to 30K monthly users; achieved perfect 100s on Lighthouse by optimizing rendering logic and backend caching to handle traffic spikes. \[Link: #link("https://bratify.vercel.app")\]],
    ),
    project(
      "Aetherline",
      "AI digitization engine for P&ID diagrams utilizing Python, OpenCV, and YOLO.",
    ),
    project(
      "AccessEye",
      "Automated ALPR and entry-management system achieving <700ms inference times on constrained edge hardware (Raspberry Pi Zero 2 W).",
    ),
  ),

  [Achievements],
  [
    *Winner:* Echelon '25 Hackathon (AI P&ID Digitization)\
    *Gold Medallist:* JuniorSkills India 2021 (Web Technologies - National Level)\
    *Leadership:* Technical Lead, GDG on Campus VIMEET (2024-25)\
    *OSS Contributor:* Astro
  ],
)
