(require 'ox-publish)

(setq org-html-metadata-timestamp-format "%d %B %Y")
(setq org-html-validation-link nil)
(setq org-export-default-language "ru")
(setq org-export-time-stamp-file nil)

(setq org-html-preamble "<link rel='stylesheet' type='text/css' href='css/site.css' />
<!-- <div class='intro'>
  <h1>
    <span class='gray'>John</span>
    <span class='black'>Doe</span>
  </h1>
  <p>Emacser</p>
</div> -->

<div class='nav'>
  <ul>
    <li><a href='index.html'>В начало</a>.</li>
    <!-- <li><a href='https://github.com/nrukin/'>GitHub</a>.</li> -->
    <!-- <li><a href='/index.xml'>RSS</a>.</li> -->
    <li><a href='about.html'>About</a>.</li>
  </ul>
</div>")

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
	 :with-toc nil
	 :with-author nil
	 :with-date t)
	("css"
	 :base-directory "css/"
	 :base-extension "css"
	 :publishing-directory "public/css"
	 :publishing-function org-publish-attachment
	 :recursive t)
	("about"
         :base-directory "about/"
         :base-extension "org"
         :recursive nil
         :publishing-function org-html-publish-to-html
         :publishing-directory "public/"
	 :with-toc nil
	 :with-author nil
	 :section-numbers nil)
	("all" :components ("posts" "css"))))

