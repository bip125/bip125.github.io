public class DirectoryProcessor {
    private File rootDirectory;
    private HtmlGenerator htmlGenerator;

    public void process() {
        processDirectory(this.rootDirectory, true);
        this.htmlGenerator.generateMakefile();
    }

    private void processDirectory(File dir, boolean isRoot) {
        Directory directory = new Directory(dir, isRoot);
        this.htmlGenerator.generateIndexHtml(directory);
        this.htmlGenerator.generateImageHtmlFiles(directory);
        for (File subdir : directory.getSubdirectories()) {
            processDirectory(subdir, false);
        }
    }
}