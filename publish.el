(require 'ox-publish)

(setq org-publish-project-alist
      '(("posts"
         :base-directory "pages/"
	 :base-extension "org"
         :publishing-function org-html-publish-to-html
         :publishing-directory "public/"
         :section-numbers nil
	 :recursive t
	 :auto-sitemap t
	 ;; :sitemap-sort-files 'anti-chronologically
	 ;; :sitemap-style 'list
	 :sitemap-title "Оглавление")
	("css"
	 :base-directory "css/"
	 :base-extension "css"
	 :publishing-directory "public/css"
	 :publishing-function org-publish-attachment
	 :recursive t)
	("all" :components ("posts" "css"))))

