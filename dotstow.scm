;;; GNU Guix -- Functional package management for GNU
;;; Copyright © 2022 Ignacio Coterillo <ignacio.coterillo@gmail.com>
;;;
;;; This file is NOT part of GNU Guix.
;;;
;;; This program is free software: you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published by
;;; the Free Software Foundation, either version 3 of the License, or
;;; (at your option) any later version.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(define-module (dotstow)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system guile)
  #:use-module (guix build-system copy)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages racket)
  #:use-module (guix licenses))

(define-public dotstow
  (package
    (name "dotstow")
    (version "0.31")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/icot/dotstow.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256 (base32 "0g4a12q6i86rxb3qpgzpfyw1s1vqsya12zl74zq3rz2q78smxnh3"))))
    (inputs
     (list guile-3.0))
    (build-system copy-build-system)
    (arguments
     '(#:install-plan
       '(("dotstow" "bin/"))))
    (synopsis "Personal dotfiles stow tool")
    (description "Like GNU STOW, more basic, with naive template support. Only for dotfiles")
    (home-page "https://github.com/icot/dotstow")
    (license gpl3+)))

(define-public dotstow-rkt
  (package
    (name "dotstow-rkt")
    (version "0.32")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/icot/dotstow.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256 (base32 "02g71wx83g8rz6wp8lkg354nlhng8abl5cjqc3wg7h8q2zbfsq1h"))))
    (inputs
     (list racket))
    (build-system copy-build-system)
    (arguments
     '(#:install-plan
       '(("dotstow.rkt" "bin/"))))
    (synopsis "Personal dotfiles stow tool. Racket implementation")
    (description "Like GNU STOW, more basic, with naive template support. Only for dotfiles")
    (home-page "https://github.com/icot/dotstow")
    (license gpl3+)))
