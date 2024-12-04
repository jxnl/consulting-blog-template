# Consulting Blog Template

Create a professional consulting blog with the MkDocs Material theme.

## Deployment Steps

1. **Install Dependencies**: Ensure all packages are installed.
   ```bash
   pip install -r requirements-doc.txt
   ```

2. **Run Locally**: Start a local server to preview your site.

   ### Standard Method
   ```bash
   mkdocs serve -w .
   ```

   ### Apple Silicon Workaround
   If you're using an Apple Silicon (M2/M3) Mac and experiencing issues with `libcairo2`, use Docker:

   ```bash
   docker-compose up --build
   ```

   This approach resolves compatibility problems by running MkDocs in a containerized environment. The provided `docker-compose.yml` and `Dockerfile` will:
   - Install necessary dependencies
   - Map port 8005 locally
   - Provide a stable development environment

3. **Deploy to GitHub Pages**: Go live with:
   ```bash
   mkdocs gh-deploy
   ```

## Tasks to Complete

- [ ] Customize `mkdocs.yml` with your site details.
- [ ] Update `docs/index.md` with your landing page info.
- [ ] Revise `docs/services.md` with your services.
- [ ] Set up [Cal.com](https://cal.com) and update links in `docs/index.md` and `docs/services.md`.
- [ ] Add blog posts to `docs/blog/posts/`.

## Crafting Effective Content

### Value Equation

Maximize content value by addressing:
- **Dream Outcome**: Reader's goal
- **Probability of Success**: Likelihood of achieving it
- **Time**: Duration needed
- **Effort**: Work required

### AIDA Framework

1. **Attention**: Capture interest
2. **Interest**: Engage with relevant info
3. **Desire**: Connect emotionally
4. **Action**: Prompt next steps

### Landing Page Essentials

1. **Hero Section**: Benefit-driven headline, pain point subheadline, strong CTA.
2. **Social Proof**: Testimonials, case studies, credentials.
3. **Value Proposition**: Outcome statements, timeframes, effort, success indicators.

### Tips for Success

- Test different versions and CTAs.
- Focus on clarity; avoid jargon.
- Build trust with specific results and testimonials.

### Common Mistakes

- Focus on benefits, not features.
- Be specific, not vague.
- Provide social proof.
- Use strong CTAs.

## Quick Start
