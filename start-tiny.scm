;;;; startup environment for TinyScheme

;; load module emulation adapted from ChickenScheme
(load "tinymodules.scm")

;; import general utitlities (Clojure, SRFI, etc.)
(import utils)

;; JSON library
(import json)

;; parameter parser
(import params)


;; load the sample program
(load "test-params.scm")

