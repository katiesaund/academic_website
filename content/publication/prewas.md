+++
title = "prewas: Data pre-processing for more informative bacterial GWAS"

# Date first published.
date = "2020-04-20"

# Authors. Comma separated list, e.g. `["Bob Smith", "David Jones"]`.
authors = ["Katie Saund<sup>1</sup>", "Zena Lapp<sup>1</sup>", "Stephanie N. Thiede<sup>1</sup>", "Ali Pirani", "Evan S. Snitkin", "<sup>1</sup>Equal Contribution"]
# Publication type.
# Legend:
# 0 = Uncategorized
# 1 = Conference proceedings
# 2 = Journal
# 3 = Work in progress
# 4 = Technical report
# 5 = Book
# 6 = Book chapter
publication_types = ["2"]

# Publication name and optional abbreviated version.
publication = "bioRxiv"
publication_short = "bioRxiv"

# Abstract and optional shortened version.
abstract = "While variant identification pipelines are becoming increasingly standardized, less attention has been paid to the pre-processing of variants prior to their use in bacterial genome-wide association studies (bGWAS). Three nuances of variant pre-processing that impact downstream identification of genetic associations include the separation of variants at multiallelic sites, separation of variants in overlapping genes, and referencing of variants relative to ancestral alleles. Here we demonstrate the importance of these variant pre-processing steps on diverse bacterial genomic datasets and present prewas, an R package, that standardizes the pre-processing of multiallelic sites, overlapping genes, and reference alleles before bGWAS. This package facilitates improved reproducibility and interpretability of bGWAS results. Prewas enables users to extract maximal information from bGWAS by implementing multi-line representation for multiallelic sites and variants in overlapping genes. Prewas outputs a binary SNP matrix that can be used for SNP-based bGWAS and will prevent the masking of minor alleles during bGWAS analysis. The optional binary gene matrix output can be used for gene-based bGWAS which will enable users to maximize the power and evolutionary interpretability of their bGWAS studies. Prewas is available for download from GitHub."

# Featured image thumbnail (optional)
image_preview = ""

# Is this a selected publication? (true/false)
selected = false

# Projects (optional).
#   Associate this publication with one or more of your projects.
#   Simply enter the filename (excluding '.md') of your project file in `content/project/`.
#   E.g. `projects = ["deep-learning"]` references `content/project/deep-learning.md`.
projects = []

# Links (optional).
url_pdf = "files/2020_prewas_mgen.pdf"
url_preprint = ""
url_code = "https://github.com/Snitkin-Lab-Umich/prewas"
url_dataset = ""
url_project = "https://github.com/Snitkin-Lab-Umich/prewas_manuscript_analysis"
url_slides = ""
url_video = ""
url_poster = ""
# url_source = "https://msphere.asm.org/content/4/2/e00138-19"
# links = [{icon_pack="fa", icon="file", name="PDF", url="files/mouse_outbreak.pdf"}]

# Custom links (optional).
#   Uncomment line below to enable. For multiple links, use the form `[{...}, {...}, {...}]`.
# url_custom = [{name = "Custom Link", url = "http://example.org"}]
# {{< youtube w7Ft2ymGmfc >}}

# Does the content use math formatting?
math = false

# Does the content use source code highlighting?
highlight = true

# Featured image
# Place your image in the `static/img/` folder and reference its filename below, e.g. `image = "example.jpg"`.
[header]
#image = "prewas_Figure_1.pdf"
#caption = "Fig. 3. Phylogenetic relationship between the mouse outbreak strain and representative C. difficile isolates."

+++
