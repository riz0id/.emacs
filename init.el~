(package-initialize)

(load "~/.emacs.d/.emacs.rc/rc.el")
(load "~/.emacs.d/.emacs.rc/fira.el")
(load "~/.emacs.d/.emacs.rc/spaceline.el")
(load "~/.emacs.d/.emacs.rc/spaceline-segments.el")
(load "~/.emacs.d/.emacs.rc/spaceline-config.el")

;; config independent packages
(rc/require
 'nix-mode
 'hindent
 )

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1) 
(require 'evil)
  (evil-mode 1)

;;; appearance
(defun rc/get-default-font ()
  (cond
   ((eq system-type 'windows-nt) "Fira Mono-14")
   ((eq system-type 'gnu/linux) "Fira Mono-14")))

(add-to-list 'default-frame-alist `(font . ,(rc/get-default-font)))

(when (display-graphic-p)
  (set-face-attribute 'fixed-pitch nil :family (rc/get-default-font)))

(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(show-paren-mode 1)

;; mode line
(require 'spaceline-config)
(spaceline-spacemacs-theme)

(setq
 spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)

;;; dired
(require 'dired-x)
(setq dired-omit-files
      (concat dired-omit-files "\\|^\\..+$"))
(setq-default dired-dwim-target t)
(setq dired-listing-switches "-alh")

;;; Haskell mode
(rc/require 'haskell-mode)

(setq haskell-process-type 'cabal-new-repl)
(setq haskell-process-log t)

(add-hook 'haskell-mode-hook 'haskell-doc-mode)
(add-hook 'haskell-mode-hook 'hindent-mode)
(add-hook 'haskell-mode-hook 'fira-code-mode)
(add-hook 'haskell-mode-hook 'intero-mode)

(with-eval-after-load 'intero
  (flycheck-add-next-checker 'intero '(warning . haskell-hlint))
)

;;; magit
(rc/require 'cl-lib)
(rc/require 'magit)

(setq magit-auto-revert-mode nil)

(global-set-key (kbd "C-c m s") 'magit-status)
(global-set-key (kbd "C-c m l") 'magit-log)

;;; Emacs lisp
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-c C-j")
                            (quote eval-print-last-sexp))))
(add-to-list 'auto-mode-alist '("Cask" . emacs-lisp-mode))

;;; ido
(rc/require 'smex 'ido-completing-read+)

(require 'ido-completing-read+)

(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (powerline intero magit ido-completing-read+ smex pretty-mode nix-mode hindent haskell-mode flymake-haskell-multi evil-visual-mark-mode)))
 '(powerline-default-separator (quote contour))
 '(powerline-height 30))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-builtin-face ((t (:foreground "#9AA9FB"))))
 '(font-lock-comment-face ((t (:foreground "#C48A90"))))
 '(font-lock-function-name-face ((t (:foreground "#FFFFFF"))))
 '(font-lock-keyword-face ((t (:foreground "#445588"))))
 '(font-lock-string-face ((t (:foreground "#D01040"))))
 '(font-lock-type-face ((t (:foreground "#445588"))))
 '(font-lock-variable-name-face ((t (:foreground "#9AA9FB"))))
 '(haskell-keyword-face ((t (:inherit font-lock-keyword-face :foreground "#9AA9FB" :weight bold))))
 '(haskell-pragma-face ((t (:foreground "#999" :weight bold))))
 '(region ((t (:background "#162947"))))
 '(spaceline-evil-emacs ((t (:background "#268BD2" :foreground "#041229" :inherit (quote mode-line)))))
 '(spaceline-evil-insert ((t (:background "#d01040" :foreground "#041229" :inherit (quote mode-line)))))
 '(spaceline-evil-motion ((t (:background "#C48A90" :foreground "#041229" :inherit (quote mode-line)))))
 '(spaceline-evil-visual ((t (:background "#099" :foreground "#041229" :inherit (quote mode-line))))))
