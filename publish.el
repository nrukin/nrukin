(require 'ox-publish)

(setq org-html-metadata-timestamp-format "%d %B %Y")
(setq org-html-validation-link nil)

(setq org-publish-project-alist
      '(("posts"
         :base-directory "pages/"
	 :base-extension "org"
         :publishing-function org-html-publish-to-html
         :publishing-directory "public/"
         :section-numbers nil
	 :recursive t
	 :auto-sitemap t
	 :sitemap-sort-files anti-chronologically
	 :sitemap-title "Содержание"
	 :sitemap-filename "index.org"
	 :sitemap-style list
	 :author "Никита Рукин"
	 :email "nikita-rukin@yandex.ru"
	 :with-timestamps nil
	 :html-head "<link rel='stylesheet' type='text/css' href='../css/site.css' />")
	("css"
	 :base-directory "css/"
	 :base-extension "css"
	 :publishing-directory "public/css"
	 :publishing-function org-publish-attachment
	 :recursive t)
	("all" :components ("posts" "css"))))

