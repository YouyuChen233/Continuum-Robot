# Dynamik und Statik mit mehreren Segmente
Odner *_allgemein sind ein allgemeines Modell eines Kontinuumroboters mit Minimalkoordinaten q=[delta_x delta_y], 
Odner *_Zweiglenkkupplung sind ein speziffisches Modell eines Kontinuumroboters mit Minimalkoordinaten q=[kappa], phi werden als Konstanten definiert, phi=[0;Pi/2;...], 
und die Geometrie des Backbone wird berücksichtigt.

## Statikmodell
- `Statik_3D_mSeg*.mw` ist Maple-Skrip,
	- `matlabexp\Statik_mSeg.m` ist Main-Matlab-Skript für Standard-Statikmodell. Geben die Seilkräfte ein, dann wird die Konfiguration des Roboters berechnet.
	- `matlabexp\Statik_mSeg_Seil.m` ist Main-Matlab-Skript für Seilkinematik. Geben die Länge ein, die man ziehen möchte, dann werden die Konfiguration des Roboters und die entsprechenden Seilkräfte berechnet.

## Dynamikmodell
- `Dynamik_3D_mSeg*.mw` ist Maple-Skrip,
	- `matlabexp\Dynamik_mSeg.m` ist Main-Matlab-Skript,

## Allgemeine Konfiguration
- `matlabexp\INIT.m` Technische Parameter werden darin intitialisieren, bitte die Anzahl der Seile und Disk überprüfen, die sollten gleich wie in Maple-Skript
- `matlabexp\reg*.m` erzeugen die benötige Funktionen automatisch, bitte in Matlab addpath CalcFun