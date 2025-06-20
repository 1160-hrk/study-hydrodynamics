# 流体力学 1

## 目次

1. [流体粒子と座標系の定義](#1-流体粒子と座標系の定義)
2. [ラグランジュ微分とオイラー微分](#2-ラグランジュ微分とオイラー微分)
   - 2.1 [物理量のラグランジュ微分](#21-物理量のラグランジュ微分)
   - 2.2 [速度のラグランジュ微分](#22-速度のラグランジュ微分)
3. [流線と流量の定義](#3-流線と流量の定義)
4. [連続方程式の導出](#4-連続方程式の導出)
5. [運動方程式の導出](#5-運動方程式の導出)
   - 5.1 [完全流体（オイラー方程式）](#51-完全流体オイラー方程式)
   - 5.2 [粘性流体（ナビエ・ストークス方程式）](#52-粘性流体ナビエストークス方程式)

---

## 1. 流体粒子と座標系の定義

流体力学では、連続体としての流体を記述するために二つの異なる座標系を用います。

### オイラー座標系（Eulerian Description）

- **独立変数** :  $\mathbf{x}, t$
   - 常に空間上の固定された点で流体の状態を観測する。

- **物理量$Q$の表現**
  - 各空間固定点$\mathbf{x}$と時刻$t$の関数: $Q = Q(\mathbf{x}, t)$
  - 固定された一点を流体が通り過ぎることで変化すると考える。

### ラグランジュ座標系（Lagrangian Description）

- **独立変数** $\mathbf{x}_0, t$
   - 初期時刻 $t=0$ に位置$\mathbf{x}_0$にいた流体粒子の移動に沿って流体の状態を観測する。

- **物理量$Q$の表現**
   - 初期座標$\mathbf{x}_0$と時刻$t$の関数: $Q = Q(\mathbf{x}, t) = Q(\mathbf{x}(\mathbf{x}_0, t), t)=\tilde{Q}(\mathbf{x}_0, t)$
- 各流体粒子を個別に追跡する記述法



### 物理的解釈

> **比喩による理解**
> 
> - **ラグランジュ法**: 川を流れる木の葉を個別に追跡する（粒子追跡）
> - **オイラー法**: 橋の上から固定点を通過する水の流れを観測する（場の観測）

### 座標変換

ラグランジュ座標とオイラー座標の関係：

$$\mathbf{x}_0 = \mathbf{x}_0(\mathbf{x}, t), \quad \mathbf{x} = \mathbf{x}(\mathbf{x}_0, t)$$

ヤコビアン行列：
$$J = \det\left(\frac{\partial \mathbf{x}_0}{\partial \mathbf{x}}\right) > 0$$

物理的意味：$J$ は体積変化率を表す。

---

## 2. ラグランジュ微分とオイラー微分

流体中の任意のスカラー場 $\phi(\mathbf{x}_0, t)$（密度、温度、圧力など）について考える。

### 基本定義

**オイラー微分**（偏微分）：
$$\left.\frac{\partial \phi}{\partial t}\right|_{\mathbf{x}} = \frac{\partial \phi(\mathbf{x}, t)}{\partial t}$$

- 固定された空間点での時間変化
- 「その場所で」の変化率

**ラグランジュ微分**（物質微分、実質微分）：
$$\frac{D\phi}{Dt} = \left.\frac{\partial \phi}{\partial t}\right|_{\mathbf{x}_0}$$

- 流体粒子に追随して観測される変化
- 「粒子について」の変化率

### 2.1 物理量のラグランジュ微分

チェーンルールを適用して：

$$\frac{D\phi}{Dt} = \frac{\partial \phi}{\partial t} + \frac{\partial \phi}{\partial x_{i}}\frac{\partial x_{i}}{\partial t}$$

ここで、$\frac{\partial x_{i}}{\partial t} = u_i$ は速度成分なので：

$$\boxed{\frac{D\phi}{Dt} = \frac{\partial \phi}{\partial t} + \mathbf{u} \cdot \nabla \phi}$$

各項の物理的意味：
- $\frac{\partial \phi}{\partial t}$：**局所変化項**（その場での変化）
- $\mathbf{u} \cdot \nabla \phi$：**移流項**（流れによる輸送効果）

### 2.2 速度のラグランジュ微分

速度場 $\mathbf{u}(\mathbf{x}_0, t)$ の物質微分は加速度を与える：

$$\boxed{\frac{D\mathbf{u}}{Dt} = \frac{\partial \mathbf{u}}{\partial t} + (\mathbf{u} \cdot \nabla)\mathbf{u}}$$

成分表示：
$$\frac{Du_i}{Dt} = \frac{\partial u_i}{\partial t} + u_j \frac{\partial u_i}{\partial x_{0j}}$$

物理的意味：
- $\frac{\partial \mathbf{u}}{\partial t}$：**局所加速度**（その場での速度変化）
- $(\mathbf{u} \cdot \nabla)\mathbf{u}$：**移流加速度**（流れの空間変化による加速度）

> **重要**: 移流項 $(\mathbf{u} \cdot \nabla)\mathbf{u}$ は非線形項であり、流体力学の複雑さの源です。

---

## 3. 流線と流量の定義

### 流体運動の可視化

| 概念 | 定義 | 数学的表現 | 物理的意味 |
|------|------|------------|------------|
| **流線** (Streamline) | ある瞬間における速度場に接線を持つ曲線 | $\frac{d\mathbf{x}_0}{ds} \parallel \mathbf{u}(\mathbf{x}_0, t)$ | 「今この瞬間」の流れの向き |
| **パスライン** (Pathline) | 個々の粒子の軌跡 | $\frac{d\mathbf{x}_0}{dt} = \mathbf{u}(\mathbf{x}_0, t)$ | 粒子が実際に通る道筋 |
| **ストリークライン** (Streakline) | 同一点から放出された粒子群の線 | 染色実験で観察される線 | 可視化で見える流れの筋 |

### 流線の微分方程式

流線上で：
$$\frac{dx_{01}}{u_1} = \frac{dx_{02}}{u_2} = \frac{dx_{03}}{u_3} = ds$$

ここで $ds$ は流線に沿った弧長要素。

### 流量の定義

**体積流量** $Q$：
$$Q = \iint_S \mathbf{u} \cdot \mathbf{n} \, dS$$

**質量流量** $\dot{m}$：
$$\dot{m} = \iint_S \rho \mathbf{u} \cdot \mathbf{n} \, dS$$

ここで：
- $S$：流れを横切る任意の面
- $\mathbf{n}$：面の単位法線ベクトル
- $\rho$：流体密度

### 流管と流束保存

**流管**：流線で構成された管状の領域

流管内での質量保存：
$$\rho_1 A_1 u_1 = \rho_2 A_2 u_2 = \text{一定}$$

非圧縮流体では：
$$A_1 u_1 = A_2 u_2 = \text{一定}$$

---

## 4. 連続方程式の導出

質量保存則を数学的に定式化します。

### 積分形の質量保存則

任意の可動体積 $V(t)$ について：

$$\frac{d}{dt}\int_{V(t)} \rho \, dV = 0$$

### レイノルズ輸送定理

可動体積における任意の物理量 $\phi$ の時間変化：

$$\frac{d}{dt}\int_{V(t)} \phi \, dV = \int_{V(t)} \frac{\partial \phi}{\partial t} dV + \oint_{\partial V(t)} \phi \mathbf{u} \cdot \mathbf{n} \, dS$$

### 連続方程式の導出

1. レイノルズ輸送定理を密度 $\rho$ に適用：
   $$\frac{d}{dt}\int_{V(t)} \rho \, dV = \int_{V(t)} \frac{\partial \rho}{\partial t} dV + \oint_{\partial V(t)} \rho \mathbf{u} \cdot \mathbf{n} \, dS$$

2. ガウスの発散定理を適用：
   $$\oint_{\partial V(t)} \rho \mathbf{u} \cdot \mathbf{n} \, dS = \int_{V(t)} \nabla \cdot (\rho \mathbf{u}) \, dV$$

3. 質量保存則より：
   $$\int_{V(t)} \left[\frac{\partial \rho}{\partial t} + \nabla \cdot (\rho \mathbf{u})\right] dV = 0$$

4. 体積 $V(t)$ は任意なので、被積分関数がゼロ：

$$\boxed{\frac{\partial \rho}{\partial t} + \nabla \cdot (\rho \mathbf{u}) = 0}$$

これが**連続方程式**（質量保存の微分形）です。

### 特殊な場合

**非圧縮流体** ($\rho = \text{const}$)：
$$\boxed{\nabla \cdot \mathbf{u} = 0}$$

**物質微分形**：
$$\frac{D\rho}{Dt} + \rho \nabla \cdot \mathbf{u} = 0$$

---

## 5. 運動方程式の導出

ニュートンの第2法則を連続体に適用します。

### 応力の概念

流体要素に作用する力：

1. **体積力** $\mathbf{f}$（重力、電磁力など）
   - 単位質量あたりの力：$\rho \mathbf{f}$

2. **表面力**（応力）
   - 応力テンソル $\boldsymbol{\sigma}_{ij}$ で記述
   - 単位面積あたりの力：$\boldsymbol{\sigma} \cdot \mathbf{n}$

### ニュートンの第2法則

流体要素について：
$$\rho \frac{D\mathbf{u}}{Dt} = \nabla \cdot \boldsymbol{\sigma} + \rho \mathbf{f}$$

### 5.1 完全流体（オイラー方程式）

**仮定**：粘性がない（$\eta = 0$）

応力テンソルは等方的圧力のみ：
$$\boldsymbol{\sigma}_{ij} = -p \delta_{ij}$$

したがって：
$$\nabla \cdot \boldsymbol{\sigma} = -\nabla p$$

**オイラー方程式**：
$$\boxed{\rho \frac{D\mathbf{u}}{Dt} = -\nabla p + \rho \mathbf{f}}$$

展開形：
$$\rho\left(\frac{\partial \mathbf{u}}{\partial t} + (\mathbf{u} \cdot \nabla)\mathbf{u}\right) = -\nabla p + \rho \mathbf{f}$$

### ベルヌーイの定理への道筋

定常流れ（$\frac{\partial \mathbf{u}}{\partial t} = 0$）で、保存力のみの場合（$\mathbf{f} = -\nabla \Phi$）：

流線に沿って：
$$\frac{1}{2}u^2 + \frac{p}{\rho} + \Phi = \text{const}$$

### 5.2 粘性流体（ナビエ・ストークス方程式）

**仮定**：ニュートン流体（応力が歪み速度に比例）

応力テンソル：
$$\boldsymbol{\sigma}_{ij} = -p\delta_{ij} + \tau_{ij}$$

粘性応力テンソル：
$$\tau_{ij} = \mu \left(\frac{\partial u_i}{\partial x_{0j}} + \frac{\partial u_j}{\partial x_{0i}}\right) + \lambda \delta_{ij} \frac{\partial u_k}{\partial x_{0k}}$$

ここで：
- $\mu$：剪断粘性係数
- $\lambda$：体積粘性係数

### 一般的なナビエ・ストークス方程式

$$\boxed{\rho \frac{D\mathbf{u}}{Dt} = -\nabla p + \mu \nabla^2 \mathbf{u} + (\mu + \lambda)\nabla(\nabla \cdot \mathbf{u}) + \rho \mathbf{f}}$$

### 非圧縮流体の場合

$\nabla \cdot \mathbf{u} = 0$ より：

$$\boxed{\rho \frac{D\mathbf{u}}{Dt} = -\nabla p + \mu \nabla^2 \mathbf{u} + \rho \mathbf{f}}$$

成分形：
$$\rho\left(\frac{\partial u_i}{\partial t} + u_j \frac{\partial u_i}{\partial x_{0j}}\right) = -\frac{\partial p}{\partial x_{0i}} + \mu \frac{\partial^2 u_i}{\partial x_{0j} \partial x_{0j}} + \rho f_i$$

### 無次元化とレイノルズ数

特性長さ $L$、特性速度 $U$ で無次元化すると、**レイノルズ数**が現れる：

$$Re = \frac{\rho U L}{\mu} = \frac{\text{慣性力}}{\text{粘性力}}$$

高レイノルズ数では乱流が、低レイノルズ数では層流が支配的となります。

---

## まとめ

### 基本方程式

1. **連続方程式**：
   $$\frac{\partial \rho}{\partial t} + \nabla \cdot (\rho \mathbf{u}) = 0$$

2. **ナビエ・ストークス方程式**：
   $$\rho \frac{D\mathbf{u}}{Dt} = -\nabla p + \mu \nabla^2 \mathbf{u} + (\mu + \lambda)\nabla(\nabla \cdot \mathbf{u}) + \rho \mathbf{f}$$

3. **状態方程式** (必要に応じて)：
   $$p = p(\rho, T)$$

### 大事なこと

- **ラグランジュ微分** $\frac{D}{Dt}$ は流体粒子に沿った状態の変化を記述する。
- **オイラー微分** $\frac{\partial \rho}{\partial t}$(普通の時間に対する偏微分)は空間固定点を流体が通り過ぎることによる状態の変化を記述する。
- **レイノルズ数**が同じ流体同士は相似関係となる。

### 次回

- 渦の定義
- 流れ関数の定義