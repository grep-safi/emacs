;;; I prefer cmd key for meta
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none)

;; Enable transient mark mode
(transient-mark-mode 1)

;;;;Org mode configuration
;; Enable Org mode
(require 'org)

;; Enable new TODO states
(setq org-todo-keywords
      '((sequence "TODO(t)" "IN-PROGRESS(i)" "|" "DONE(d)" "CANCELLED(c)")))

(setq org-tag-alist '(("@work" . ?w) ("@personal" . ?h)))

;; Shortcuts for crucial org commands (idk what # is for)
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;; org agenda files for GTD system
(setq org-agenda-files '("~/org-docs/gtd/inbox.org"
                         "~/org-docs/gtd/gtd.org"
                         "~/org-docs/gtd/tickler.org"))

;; org capture templates for different places to capture stuff
(setq org-capture-templates '(("t" "Todo [inbox]" entry
                               (file+headline "~/org-docs/gtd/inbox.org" "Tasks")
                               "* TODO %i%?")
                              ("T" "Tickler" entry
                               (file+headline "~/org-docs/gtd/tickler.org" "Tickler")
                               "* %i%? \n %U")))

;; Refile inputs from inbox.org to these locations
(setq org-refile-targets '(("~/org-docs/gtd/gtd.org" :maxlevel . 3)
                           ("~/org-docs/gtd/someday.org" :level . 1)
                           ("~/org-docs/gtd/tickler.org" :maxlevel . 2)))

;; Look specifically for these custom tags
(setq org-agenda-custom-commands 
      '(("w" "Work related things" tags-todo "@work"
         ((org-agenda-overriding-header "Work")))))

;;;; End Org mode config
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
