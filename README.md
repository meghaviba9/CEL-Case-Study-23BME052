# CEL-Case-Study-23BME052
Introduction:

This MATLAB project performs modal analysis of a 5-degree-of-freedom mass–spring system.

It calculates the natural frequencies and mode shapes by solving the generalized eigenvalue equation:KΦ = ω²MΦ

The program also plots the vibration mode shapes for visualization.

The structure consists of:

5 lumped masses → m₁ … m₅

5 springs → k₁ … k₅

First spring fixed to a wall

Final mass free

Wall — k1 — m1 — k2 — m2 — k3 — m3 — k4 — m4 — k5 — m5


Applications

This type of model is commonly used for:

1) Multi-storey building vibration
2) 
3) Mechanical chain systems
4) 
3)Structural dynamics studies

⚙️ Features

✔ User inputs masses and stiffness values

✔ Automatically forms Mass Matrix and Stiffness Matrix

✔ Solves eigenvalue problem using MATLAB

✔ Sorts natural frequencies

✔ Normalizes mode shapes

✔ Plots all vibration modes


🧮 Mathematical Formulation

Mass Matrix

[ m1 0 0 0 0
  0 m2 0 0 0
  0 0 m3 0 0
  0 0 0 m4 0
  0 0 0 0 m5]
  
Diagonal matrix:

M = diag(m1, m2, m3, m4, m5)

Stiffness Matrix Structure

[ k1+k2 -k2 0 0 0
  -k2 k2+k3 -k3 0 0
   0 -k3 k3+k4 -k4 0
   0 0 -k4 k4+k5 -k5
   0 0 0 -k5 k5 ]


Expected Behaviour:

Mode 1 → all masses move in same direction

Mode 2 → one node forms

Mode 3 → two nodes form

Higher modes show alternating vibration patterns.

This matches classical vibration theory.


Expected Behaviour for Frequency Plot:
If excitation frequency is swept and amplitude is plotted.
The graph will show five resonance peaks (equal to number of masses).
Peaks occur near the natural frequencies ω₁ < ω₂ < ω₃ < ω₄ < ω₅.
The first peak is usually largest (fundamental mode dominates).
Higher-mode peaks become sharper and narrower.
At very high frequencies, response amplitude decreases.


Author:
Meghaviba Vaghela
(Mechanical engineering student)


