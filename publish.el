(require 'ox-publish)

(setq org-html-metadata-timestamp-format "%d %B %Y")
(setq org-html-validation-link nil)

(defun blog/org-publish-org-sitemap-format-entry (entry style project)
  (format "%s - [[file:%s][%s]]"
	  (format-time-string "%F" (org-publish-find-date entry project))
	  entry
	  (org-publish-find-title entry project)))

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
	 :sitemap-format-entry blog/org-publish-org-sitemap-format-entry
	 :sitemap-title "Содержание"
	 :sitemap-filename "index.org"
	 :sitemap-style list
	 :author "Никита Рукин"
	 :email "nikita-rukin@yandex.ru"
	 :with-timestamps nil
	 :with-toc nil
	 :with-author nil
	 :with-date t
	 :with-timestamps nil
	 :html-head "<link rel='stylesheet' type='text/css' href='../css/site.css' />")
	("css"
	 :base-directory "css/"
	 :base-extension "css"
	 :publishing-directory "public/css"
	 :publishing-function org-publish-attachment
	 :recursive t)
	("all" :components ("posts" "css"))))

