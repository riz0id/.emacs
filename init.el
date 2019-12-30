(package-initialize)

(load "~/.emacs.d/.emacs.rc/rc.el")
(load "~/.emacs.d/.emacs.rc/fira.el")
(load "~/.emacs.d/.emacs.rc/ligatures.el")
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

(add-hook 'haskell-mode-hook 'haskell-doc-mode)
(add-hook 'haskell-mode-hook 'hindent-mode)
(add-hook 'haskell-mode-hook 'fira-code-mode)
(add-hook 'haskell-mode-hook 'flycheck-mode)
(add-hook 'haskell-mode-hook 'company-mode)

;; agda
(add-hook 'agda2-mode 'fira-code-mode)

;;; magit
(rc/require 'cl-lib)
(rc/require 'magit)

(setq magit-auto-revert-mode nil)

(global-set-key (kbd "C-c m s") 'magit-status)
(global-set-key (kbd "C-c m l") 'magit-log)

;;; emacs lisp
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-c C-j")
                            (quote eval-print-last-sexp))))
(add-to-list 'auto-mode-alist '("Cask" . emacs-lisp-mode))

;;; agda
(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))

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
 '(flycheck-after-syntax-check-hook nil)
 '(flycheck-before-syntax-check-hook nil)
 '(flycheck-check-syntax-automatically
   (quote
    (save idle-change idle-buffer-switch new-line mode-enabled)))
 '(flycheck-checkers
   (quote
    (ada-gnat asciidoctor asciidoc bazel-buildifier c/c++-clang c/c++-gcc c/c++-cppcheck cfengine chef-foodcritic coffee coffee-coffeelint coq css-csslint css-stylelint cuda-nvcc cwl d-dmd dockerfile-hadolint emacs-lisp emacs-lisp-checkdoc erlang-rebar3 erlang eruby-erubis eruby-ruumba fortran-gfortran go-gofmt go-golint go-vet go-build go-test go-errcheck go-unconvert go-staticcheck groovy haml handlebars haskell-stack-ghc haskell-ghc haskell-hlint html-tidy javascript-eslint javascript-jshint javascript-standard json-jsonlint json-python-json json-jq jsonnet less less-stylelint llvm-llc lua-luacheck lua markdown-markdownlint-cli markdown-mdl nix nix-linter opam perl perl-perlcritic php php-phpmd php-phpcs processing proselint protobuf-protoc protobuf-prototool pug puppet-parser puppet-lint python-flake8 python-pylint python-pycompile python-mypy r-lintr racket rpm-rpmlint rst-sphinx rst ruby-rubocop ruby-reek ruby-rubylint ruby ruby-jruby rust-cargo rust rust-clippy scala scala-scalastyle scheme-chicken scss-lint scss-stylelint sass/scss-sass-lint sass scss sh-bash sh-posix-dash sh-posix-bash sh-zsh sh-shellcheck slim slim-lint sql-sqlint systemd-analyze tcl-nagelfar terraform terraform-tflint tex-chktex tex-lacheck texinfo textlint typescript-tslint verilog-verilator vhdl-ghdl xml-xmlstarlet xml-xmllint yaml-jsyaml yaml-ruby yaml-yamllint)))
 '(flycheck-display-errors-delay 0)
 '(flycheck-highlighting-mode (quote sexps))
 '(flycheck-hlintrc nil)
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t)
 '(package-selected-packages
   (quote
    (use-package powerline magit ido-completing-read+ smex pretty-mode nix-mode hindent haskell-mode flymake-haskell-multi evil-visual-mark-mode)))
 '(powerline-default-separator (quote slant))
 '(powerline-height 30))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(agda2-highlight-catchall-clause-face ((t (:inherit region))))
 '(agda2-highlight-coverage-problem-face ((t (:background "#C48"))))
 '(agda2-highlight-datatype-face ((t (:foreground "#445588" :slant italic :weight bold))))
 '(agda2-highlight-deadcode-face ((t (:background "#C48A90"))))
 '(agda2-highlight-error-face ((t (:foreground "#990000" :underline t))))
 '(agda2-highlight-function-face ((t (:foreground "#9AA9FB"))))
 '(agda2-highlight-inductive-constructor-face ((t (:foreground "#FFFFFF"))))
 '(agda2-highlight-keyword-face ((t (:foreground "#9AA9FB" :weight bold))))
 '(agda2-highlight-module-face ((t (:foreground "#999" :slant italic))))
 '(agda2-highlight-number-face ((t (:foreground "#099"))))
 '(agda2-highlight-operator-face ((t (:foreground "#9AA9FB"))))
 '(agda2-highlight-postulate-face ((t (:foreground "#445588"))))
 '(agda2-highlight-primitive-face ((t (:foreground "#9AA9FB"))))
 '(agda2-highlight-primitive-type-face ((t (:foreground "#445588" :weight bold))))
 '(agda2-highlight-record-face ((t (:foreground "#445588"))))
 '(agda2-highlight-symbol-face ((t (:foreground "#9AA9FB"))))
 '(agda2-highlight-unsolved-constraint-face ((t (:background "#C48"))))
 '(agda2-highlight-unsolved-meta-face ((t (:background "#C48"))))
 '(flycheck-error ((t (:underline (:color "#990000" :style wave)))))
 '(flycheck-warning ((t (:underline (:color "#099" :style wave)))))
 '(font-lock-builtin-face ((t (:foreground "#9AA9FB"))))
 '(font-lock-comment-face ((t (:foreground "#C48A90"))))
 '(font-lock-function-name-face ((t (:foreground "#FFFFFF"))))
 '(font-lock-keyword-face ((t (:foreground "#445588"))))
 '(font-lock-string-face ((t (:foreground "#D01040"))))
 '(font-lock-type-face ((t (:foreground "#445588"))))
 '(font-lock-variable-name-face ((t (:foreground "#9AA9FB"))))
 '(haskell-keyword-face ((t (:inherit font-lock-keyword-face :foreground "#9AA9FB" :weight bold))))
 '(haskell-pragma-face ((t (:foreground "#999" :weight bold))))
 '(highlight ((t (:inherit region))))
 '(region ((t (:background "#162947"))))
 '(spaceline-evil-emacs ((t (:background "#268BD2" :foreground "#041229" :inherit (quote mode-line)))))
 '(spaceline-evil-insert ((t (:background "#d01040" :foreground "#041229" :inherit (quote mode-line)))))
 '(spaceline-evil-motion ((t (:background "#C48A90" :foreground "#041229" :inherit (quote mode-line)))))
 '(spaceline-evil-visual ((t (:background "#099" :foreground "#041229" :inherit (quote mode-line))))))
