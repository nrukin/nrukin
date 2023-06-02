(require 'ox-publish)

(setq org-publish-project-alist
      '(("blog"
         :base-directory "pages/"
	 :base-extension "org"
         :publishing-function org-html-publish-to-html
         :publishing-directory "public/"
         :section-numbers nil
	 :recursive t
	 :auto-sitemap t
	 ;; :sitemap-sort-files 'anti-chronologically
	 ;; :sitemap-style 'list
	 :sitemap-title "Оглавление")))

