#set page(
  paper: "a4",
  margin: 0.5in,
)

#set text(
  font: "EB Garamond",
  size: 11pt,
)

#set par(
  leading: 0.45em,
)

#let accent = rgb("#4541B4")
#let email = "pranav@karawale.com"
#let phone = "+91 XXXXX XXXXX"
#let location = "Navi Mumbai, IN"
#let website = "https://karawale.com"
#let github = "https://github.com/retronav"
#let linkedin = "https://linkedin.com/in/retronav"

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
  columns: (1fr, 1fr),
  gutter: 4pt,

  stack(
    spacing: 4pt,
    text(size: 24pt, weight: "semibold", tracking: -1pt)[Pranav Karawale],
    text(size: 12pt, weight: "medium", fill: accent)[precision _beyond_ pixels.],
  ),

  align(right)[
    #link("mailto:" + email)[#email] | #phone \
    #location | #link(website)[karawale.com] \
    #link(github)[github.com/retronav] | #link(linkedin)[linkedin.com/in/retronav]
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
  [Final-year Computer Engineering student and founding engineer specializing in high-throughput backend systems (Go, Node.js) and applied ML (Computer Vision). Scaled a consumer app to 50k+ MAU and built edge-deployed industrial IoT pipelines. Seeking New Grad backend or ML engineering roles.],

  [Education],
  education(
    "University Of Mumbai",
    "B.E. Computer Engineering",
    "Nov. 2022",
    "Jun. 2026",
  ),

  [Skills],
  grid(
    columns: (1fr, 1fr),
    gutter: 4pt,
    [
      *Languages:* Python, TypeScript, Go, Rust, Bash\
      *Backend:* Node.js, Next.js, FastAPI, MQTT\
      *Databases:* PostgreSQL, MongoDB\
    ],
    [
      *Infrastructure:* AWS (EC2, S3), Docker, Traefik, Prometheus, Grafana\
      *AI & CV:* TensorFlow, YOLO, OpenCV, LLM Tooling\
      *Hardware & IoT:* Raspberry Pi, Embedded Linux, LoRaWAN, STM32, Modbus/PLC\
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
        - Engineered an autonomous fire suppression system by deploying a custom YOLO vision model (0.77 mAP\@0.50) on edge hardware, integrating it with PLCs via Modbus to automatically target and control fire monitor pumps.
        - Built a high-throughput metadata aggregation service (Node.js/PostgreSQL) that processed and indexed 15M+ historical records in a single day, optimizing architecture to continuously ingest live data streams.
        - Developed an MQTT-based real-time IoT dashboard (Next.js, PostgreSQL) for critical industrial systems (water, fire, safety), managing 10+ live on-site instances with 24/7 uptime and automated email alerting.
        - Architected high-availability Docker deployments behind Traefik reverse proxies for a multi-tenant SaaS ERP, implementing Prometheus/Grafana observability to maintain 99.9% uptime.
        - Designed a scalable AWS backend for an enterprise LMS platform, reliably serving over 200,000 query loads to concurrent learners.
      ],
    ),
    experience(
      "Avignon Université",
      "Research Intern",
      "Jun. 2025",
      "Aug. 2025",
      "Avignon, France",
      [
        - Engineered LoRaPWN, a novel MAC-layer security enhancement for LoRaWAN, integrating ChaCha20-Poly1305 AEAD cryptography to secure IoT communications.
        - Designed and benched an STM32 hardware testbed, achieving a 10x increase in cryptographic throughput and a 90% reduction in energy consumption vs standard AES implementations.
      ],
    ),
    experience(
      "Freelance Client",
      "AI Tooling Engineer",
      "Apr. 2023",
      "Dec. 2023",
      "Remote",
      [
        - Engineered a novel, multi-LLM prompt orchestration framework utilizing React JSX as a declarative language to build and manage complex agentic workflows.
        - Designed the framework's core abstraction layer, enabling seamless cross-model compatibility and establishing structured outputs for customized AI advisory agents.
      ],
    ),
  ),

  [Projects],
  stack(
    spacing: 6pt,
    project(
      "Bratify",
      [Built a viral interactive image generator using Svelte. Optimized rendering logic and backend caching to successfully handle traffic spikes of up to 50,000 monthly active users without downtime. \[Link: #link("https://bratify.vercel.app")\]],
    ),
    project(
      "Aetherline",
      "AI digitization engine for P&ID diagrams utilizing Python, OpenCV, and YOLO. Winner of the Echelon '25 Hackathon.",
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
