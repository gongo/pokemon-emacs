Pokémon-Emacs
==================================================

Pokemon might be in your open file....

![](images/pokemon-emacs-1.png)


Requirements
------------------------------

- Emacs 24 or higher
- The variable `mode-line-buffer-identification` is included in `mode-line-format`

    ```
    (when (memq 'mode-line-buffer-identification mode-line-format)
      t) ; => t
    ```

Installation
------------------------------

:pizza: Good luck! :pizza:

Usage
------------------------------

```
M-x pokemon-emacs-mode
```

![](images/pokemon-emacs-2.png)

Pokémon is determined uniquely by your open filename (or buffer-name).

License
------------------------------

MIT
