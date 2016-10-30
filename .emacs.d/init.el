;; ELPA
(require 'package)

;; Add package repos
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)

;; Packages to check for
(defvar elpa-required-packages '(
				 ac-nrepl
				 auto-complete
				 cider
				 clojure-mode
				 clojurescript-mode
				 color-theme-sanityinc-tomorrow
				 context-coloring
				 paredit				 
				 popup
				 rainbow-delimiters
				 rainbow-mode
				 rust-mode
				 win-switch
				 )
  )

;; Make sure those are installed
(dolist (pkg elpa-required-packages)
  (when (not (package-installed-p pkg))
    (package-install pkg)))

;; Load theme
(load-theme `sanityinc-tomorrow-eighties t)

;; cider and nREPL
(add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)
(setq nrepl-popup-stacktraces nil)
(add-to-list 'same-window-buffer-names "<em>nrepl</em>")

;; General Auto-Complete
(require 'auto-complete-config)
(setq ac-delay 0.0)
(setq ac-quick-help-delay 0.5)
(ac-config-default)

;; ac-nrepl (Auto-complete for the nREPL)
(require 'ac-nrepl)
(add-hook 'cider-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
(add-to-list 'ac-modes 'cider-mode)
(add-to-list 'ac-modes 'cider-repl-mode)

(add-hook 'clojure-mode-hook 'paredit-mode)

;; Show parenthesis mode
(setq show-paren-delay 0)
(setq show-paren-style 'parenthesis)
(show-paren-mode 1)

;; Show rainbow delimiters
(global-rainbow-delimiters-mode)

;; Hide menu bar
(menu-bar-mode -1)

;; Enable window switcher plugin
(require 'win-switch)
(global-set-key "\C-xo" 'win-switch-dispatch)


;; Set frame title to `file_name` + `directory`
(setq frame-title-format
      '("" "%b ⛧ " (:eval (if (buffer-file-name)
			      (abbreviate-file-name (file-name-directory buffer-file-name))
			    "???"))))

;; Set terminal title to match frame title
(add-to-list 'load-path "~/.emacs.d/scripts/")
(when (and (not window-system)
	   (string-match "^xterm" (getenv "TERM")))
  (require 'xterm-title)
  (xterm-title-mode 1))
