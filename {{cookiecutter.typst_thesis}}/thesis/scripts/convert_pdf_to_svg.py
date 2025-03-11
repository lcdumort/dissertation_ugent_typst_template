#!/usr/bin/env python3
from pathlib import Path
import subprocess
from stepup.core.script import driver

def info():
    root_path = Path("../papers/")
    output_path = Path("../papers_svg/")
    pdfs = find_papers(root_path)
    outputs = []
    paper_to_output = {}
    for pdf in pdfs:
        ot = output_path / pdf.stem
        ot.mkdir(exist_ok=True)
        names = generate_names(pdf_path=pdf,
                                      output_path=ot)
        outputs.append(str(ot)+'/')
        outputs.extend(names)
        paper_to_output[str(pdf)] = names
        print(ot)
    pdfs = [str(pdf) for pdf in pdfs]
    return {
        "inp": pdfs,
        "out": outputs,
        "paper_to_output": paper_to_output,
    }

def find_papers(paper_directory: Path):
    if not paper_directory.is_dir():
        print(f"Folder '{paper_directory}' does not exist.")
        return
    
    pdf_files = [f for f in paper_directory.rglob("*.pdf") if f.suffix=='.pdf']
    return pdf_files

def count_pages_of_pdf(pdf_path: str):
    num_pages = int(subprocess.run(["pdfinfo", pdf_path],
                                   capture_output=True,
                                   text=True
    ).stdout.split("Pages:")[1].split("\n")[0].strip())
    return num_pages

def generate_names(pdf_path, output_path):
    pdf_path = Path(pdf_path)
    page_count = count_pages_of_pdf(pdf_path)
    output = []
    for page in range(1, page_count+1): 
        output_svg = Path(output_path, f"page_{page:03}.svg")
        output.append(str(output_svg))
    return output

def convert_pdf_to_svgs(pdf_path, names): 
    # generate the folder if it doesn't exist
    pdf_path = Path(pdf_path)

    # Convert each page
    for page, output_svg in enumerate(names):
        subprocess.run([
            "pdf2svg", pdf_path, output_svg, str(page+1)
        ])
    
def run(paper_to_output):
    print('executing run')
    for pdf, names in paper_to_output.items():
        convert_pdf_to_svgs(pdf, names)

if __name__ == "__main__":
    driver()