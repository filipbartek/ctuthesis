# Vampire

## Download

[Releases](https://github.com/vprover/vampire/releases)

## How to run

```
vampire --input_syntax tptp --proof tptp --output_axiom_names true
```

## Interesting options

- `--input_syntax tptp`
- `--proof tptp`
- `--output_axiom_names true`
- `--statistics full`
- `--show_active on`

# Axioms

Sources of axioms (in [TPTP](https://www.tptp.org/)):

- `NUM001-0.ax`
- `NUM002-0.ax`

# Future improvements

- Can we use ATPs to optimize?
- When should we use an ATP instead of a SMT solver?
- How is this related to LLMs?
- How can ATPs be combined with machine learning / inductive reasoning?
- Deductive vs. inductive (vs. abductive) reasoning
- Compare to CSP, MIP, SAT, Prolog, etc.
- Logic: classical vs. intuitionistic vs. modal
- How is ATP used in mathematics?
- When should I use an ATP?
- How is this related to static program analysis / program verification?
- Add a link to the thesis and an apetizer slide
- Relate to reasoning LLMs
- Show an example of software verification
