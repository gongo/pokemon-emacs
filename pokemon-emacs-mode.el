;;; pokemon-emacs-mode.el --- Pokemon-Emacs

;; Author: Wataru MIYAGUNI <gonngo@gmail.com>
;; URL: https://github.com/gongo/pokemon-emacs
;; Version: 0.0.1
;; Keywords: pokemon minor-mode

;; Copyright (c) 2016 Wataru MIYAGUNI
;;
;; MIT License
;;
;; Permission is hereby granted, free of charge, to any person obtaining
;; a copy of this software and associated documentation files (the
;; "Software"), to deal in the Software without restriction, including
;; without limitation the rights to use, copy, modify, merge, publish,
;; distribute, sublicense, and/or sell copies of the Software, and to
;; permit persons to whom the Software is furnished to do so, subject to
;; the following conditions:
;;
;; The above copyright notice and this permission notice shall be
;; included in all copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
;; NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
;; LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
;; OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
;; WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


;;; Commentary:

;;
;; Pokemon might be in your open file.
;;
;; Requirements
;;
;;   - Emacs 24 or higher
;;   - `mode-line-buffer-identification' is included in `mode-line-format'
;;
;; ## Usage
;;
;;   1. Call 'M-x pokemon-emacs-mode'
;;   2. See mode-line area.
;;
;;       <Gotta pokemon:"pokemon-name">
;;

;;; Code:
(require 'cl-lib)

;; https://en.wikipedia.org/wiki/List_of_Pok%C3%A9mon
(defconst pokemon--monsters '(
                              "Fushigidane"  "Fushigisou"  "Fushigiban"
                              "Hitokage"     "Lizardo"     "Lizardon"
                              "Zenigame"     "Kameil"      "Kamex"
                              "Caterpie"     "Transel"     "Butterfree"
                              "Beedle"       "Cocoon"      "Spear"
                              "Poppo"        "Pigeon"      "Pigeot"
                              "Koratt"       "Ratt"
                              "Onisuzume"    "Onidrill"
                              "Arbo"         "Arbok"
                              "Pikachu"      "Raichu"
                              "Sand"         "Sandpan"
                              "Nidoran♀"    "Nidorin"     "Nidoqueen"
                              "Nidoran♂"    "Nidorino"    "Nidoking"
                              "Pippi"        "Pixy"
                              "Rokon"        "Kyukon"
                              "Purin"        "Pukurin"
                              "Zubat"        "Golbat"
                              "Nazonokus"    "Kusaihan"    "Ruffresia"
                              "Paras"        "Parasect"
                              "Kongpang"     "Morphon"
                              "Digd"         "Dugtrio"
                              "Nyarth"       "Persian"
                              "Koduck"       "Golduck"
                              "Mankey"       "Okorizaru"
                              "Gardie"       "Windie"
                              "Nyoromo"      "Nyorozo"     "Nyorobon"
                              "Casey"        "Yungerer"    "Foodin"
                              "Wanriky"      "Goriky"      "Kairiky"
                              "Madatsubomi"  "Utsudon"     "Utsubot"
                              "Menokurage"   "Dokukurage"
                              "Ishitsubute"  "Golone"      "Golony"
                              "Ponyt"        "Gallop"
                              "Yadon"        "Yadoran"
                              "Coil"         "Rarecoil"
                              "Kamonegi"
                              "Dodo"         "Dodrio"
                              "Pawou"        "Jugon"
                              "Betbeter"     "Betbeton"
                              "Shellder"     "Parshen"
                              "Ghos"         "Ghost"       "Gangar"
                              "Iwark"
                              "Sleep"        "Sleeper"
                              "Crab"         "Kingler"
                              "Biriridama"    "Marumine"
                              "Tamatama"      "Nassy"
                              "Karakara"      "Garagar"
                              "Sawamular"
                              "Ebiwalar"
                              "Beroring"
                              "Dogars"       "Matadogas"
                              "Sihorn"       "Sidon"
                              "Lucky"
                              "Monjar"
                              "Garur"
                              "Tattu"        "Seadr"
                              "Tosakinto"    "Azumao"
                              "Hitodeman"    "Starmie"
                              "Barrierd"
                              "Strike"       "Rougel"
                              "Eleboo"       "Boober"
                              "Kailios"
                              "Kentauros"
                              "Koiking"      "Gyarados"
                              "Laplace"
                              "Metamon"
                              "Eievui"       "Showers"     "Thunders" "Booster"
                              "Polygon"
                              "Omnite"       "Omstar"
                              "Kabuto"       "Kabutops"
                              "Pter"
                              "Kabigon"
                              "Freezer"
                              "Thunder"
                              "Fire"
                              "Miniryu"      "Hakuryu"     "Kairyu"
                              "Mewtwo"
                              "Mew"
                              ))

(defconst pokemon--mode-line-cell
  '(:eval (list " " (pokemon-get-daze))))

(defun pokemon--get (filename)
  "Return the Pokemon name from `pokemon--monsters'.

This function provides a unique name for each filenames."
  (let ((index (mod (random filename) (length pokemon--monsters))))
    (nth index pokemon--monsters)))

(defun pokemon-get-daze ()
  (let ((filename (or (buffer-file-name) (buffer-name))))
    (format "<Gotta pokemon:\"%s\">" (pokemon--get filename))))

(define-minor-mode pokemon-emacs-mode ()
  :global t
  :group 'pokemon
  :lighter " POKEMON"
  (let ((insert-cell (memq 'mode-line-buffer-identification mode-line-format))
        (pokemon-cell-exist-p (memq pokemon--mode-line-cell mode-line-format)))
    (when insert-cell
      (if pokemon-emacs-mode
          (unless pokemon-cell-exist-p
            (setcdr insert-cell (cons pokemon--mode-line-cell (cdr insert-cell))))
        (when pokemon-cell-exist-p
          (delq pokemon--mode-line-cell mode-line-format))))))

(provide 'pokemon-emacs-mode)

;;; pokemon-emacs-mode.el ends here
