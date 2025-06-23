# 流体力学 2

## 目次

- [流体力学 2](#流体力学-2)
  - [目次](#目次)
  - [1. 渦と渦度の理論](#1-渦と渦度の理論)
    - [1.1 渦度の定義](#11-渦度の定義)
    - [物理的意味](#物理的意味)
    - [1.2 渦線と渦管](#12-渦線と渦管)
    - [渦管の性質](#渦管の性質)
    - [1.3 ケルビンの循環定理](#13-ケルビンの循環定理)
    - [証明の概略](#証明の概略)
  - [2. 流れ関数とポテンシャル関数](#2-流れ関数とポテンシャル関数)
    - [2.1 流れ関数の定義](#21-流れ関数の定義)
    - [流れ関数の性質](#流れ関数の性質)
    - [2.2 速度ポテンシャル](#22-速度ポテンシャル)
    - [ポテンシャル流れの性質](#ポテンシャル流れの性質)
    - [2.3 複素ポテンシャル](#23-複素ポテンシャル)
    - [コーシー・リーマンの関係](#コーシーリーマンの関係)
  - [3. 理想流体の基本解](#3-理想流体の基本解)
    - [3.1 一様流](#31-一様流)
    - [3.2 湧き出し・吸い込み](#32-湧き出し吸い込み)
    - [3.3 循環流（渦）](#33-循環流渦)
    - [3.4 二重極](#34-二重極)
  - [4. 物体まわりの流れ](#4-物体まわりの流れ)
    - [4.1 円柱まわりの流れ](#41-円柱まわりの流れ)
    - [ダランベールのパラドックス](#ダランベールのパラドックス)
    - [4.2 クッタ・ジューコフスキーの定理](#42-クッタジューコフスキーの定理)
    - [証明の概略](#証明の概略-1)
  - [5. 境界層理論の基礎](#5-境界層理論の基礎)
    - [レイノルズ数と流れの特性](#レイノルズ数と流れの特性)
    - [プラントルの境界層概念](#プラントルの境界層概念)
    - [境界層厚さ](#境界層厚さ)
    - [境界層方程式](#境界層方程式)
    - [ブラジウス解](#ブラジウス解)
  - [まとめ](#まとめ)
    - [基本概念](#基本概念)
    - [重要な定理](#重要な定理)
    - [流れの分類](#流れの分類)
    - [次回予定](#次回予定)

---

## 1. 渦と渦度の理論

### 1.1 渦度の定義

**渦度**（vorticity）は流体の局所的な回転の強さを表す量です。

$$\boldsymbol{\omega} = \nabla \times \mathbf{u}$$

成分表示：
$$\omega_i = \epsilon_{ijk} \frac{\partial u_k}{\partial x_j}$$

直交座標系では：
$$\boldsymbol{\omega} = \left(\frac{\partial u_z}{\partial y} - \frac{\partial u_y}{\partial z}\right)\mathbf{e}_x + \left(\frac{\partial u_x}{\partial z} - \frac{\partial u_z}{\partial x}\right)\mathbf{e}_y + \left(\frac{\partial u_y}{\partial x} - \frac{\partial u_x}{\partial y}\right)\mathbf{e}_z$$

### 物理的意味

渦度の大きさ $|\boldsymbol{\omega}|$ は、流体要素の角速度の2倍に等しい：

$$|\boldsymbol{\omega}| = 2\Omega$$

ここで $\Omega$ は流体要素の角速度。

### 1.2 渦線と渦管

| 概念 | 定義 | 数学的表現 |
|------|------|------------|
| **渦線** (Vortex line) | 各点で渦度ベクトルに接する曲線 | $\frac{d\mathbf{x}}{ds} \parallel \boldsymbol{\omega}(\mathbf{x}, t)$ |
| **渦管** (Vortex tube) | 渦線で構成される管状領域 | 渦線束 |
| **渦糸** (Vortex filament) | 断面積が無限小の渦管 | 理想化された渦 |

### 渦管の性質

1. **渦管の強さは一定**：
   $$\Gamma = \oint_C \mathbf{u} \cdot d\mathbf{l} = \iint_S \boldsymbol{\omega} \cdot \mathbf{n} dS = \text{const}$$

2. **渦管は閉じているか境界に達する**：
   - 流体内で渦管が突然終わることはない

3. **ヘルムホルツの渦定理**：
   - 渦管は流体粒子とともに移動する
   - 渦管の強さは時間不変

### 1.3 ケルビンの循環定理

**循環**の定義：
$$\Gamma = \oint_C \mathbf{u} \cdot d\mathbf{l}$$

**ケルビンの定理**：
理想流体（非粘性・非圧縮）で保存力場中では、流体粒子からなる任意の閉曲線の循環は時間不変：

$$\frac{D\Gamma}{Dt} = 0$$

### 証明の概略

$$\frac{D\Gamma}{Dt} = \frac{D}{Dt}\oint_C \mathbf{u} \cdot d\mathbf{l} = \oint_C \frac{D\mathbf{u}}{Dt} \cdot d\mathbf{l} + \oint_C \mathbf{u} \cdot \frac{Dd\mathbf{l}}{Dt}$$

オイラー方程式を用いると：
$$\frac{D\mathbf{u}}{Dt} = -\frac{1}{\rho}\nabla p + \mathbf{f}$$

保存力 $\mathbf{f} = -\nabla \Phi$ とすると：
$$\oint_C \frac{D\mathbf{u}}{Dt} \cdot d\mathbf{l} = -\oint_C \frac{1}{\rho}\nabla p \cdot d\mathbf{l} - \oint_C \nabla \Phi \cdot d\mathbf{l} = 0$$

---

## 2. 流れ関数とポテンシャル関数

### 2.1 流れ関数の定義

**2次元非圧縮流れ**において、連続方程式：
$$\frac{\partial u_x}{\partial x} + \frac{\partial u_y}{\partial y} = 0$$

を自動的に満たすように**流れ関数** $\psi(x, y, t)$ を導入：

$$\boxed{u_x = \frac{\partial \psi}{\partial y}, \quad u_y = -\frac{\partial \psi}{\partial x}}$$

### 流れ関数の性質

1. **流線の方程式**：
   $$\psi(x, y, t) = \text{const}$$

2. **体積流量**：
   2点A, B間の単位幅あたりの体積流量：
   $$Q_{AB} = \psi_B - \psi_A$$

3. **渦度との関係**：
   $$\omega_z = \frac{\partial u_y}{\partial x} - \frac{\partial u_x}{\partial y} = -\nabla^2 \psi$$

### 2.2 速度ポテンシャル

**非回転流れ**（$\boldsymbol{\omega} = 0$）では、**速度ポテンシャル** $\phi(x, y, z, t)$ が存在：

$$\boxed{\mathbf{u} = \nabla \phi}$$

成分表示：
$$u_x = \frac{\partial \phi}{\partial x}, \quad u_y = \frac{\partial \phi}{\partial y}, \quad u_z = \frac{\partial \phi}{\partial z}$$

### ポテンシャル流れの性質

1. **ラプラス方程式**：
   非圧縮条件より：
   $$\nabla \cdot \mathbf{u} = \nabla^2 \phi = 0$$

2. **ベルヌーイの定理**：
   $$\frac{\partial \phi}{\partial t} + \frac{1}{2}|\nabla \phi|^2 + \frac{p}{\rho} + \Phi = \text{const}$$

### 2.3 複素ポテンシャル

**2次元ポテンシャル流れ**では、複素変数 $z = x + iy$ を用いて：

$$\boxed{w(z) = \phi(x, y) + i\psi(x, y)}$$

**複素速度**：
$$\frac{dw}{dz} = u_x - iu_y$$

### コーシー・リーマンの関係

$$\frac{\partial \phi}{\partial x} = \frac{\partial \psi}{\partial y}, \quad \frac{\partial \phi}{\partial y} = -\frac{\partial \psi}{\partial x}$$

これにより：
- $\phi$ は速度ポテンシャル
- $\psi$ は流れ関数
- 両者は調和関数

---

## 3. 理想流体の基本解

### 3.1 一様流

**複素ポテンシャル**：
$$w = Uz$$

ここで $U$ は一様流の速度。

**速度場**：
$$u_x = U, \quad u_y = 0$$

**流線**：$y = \text{const}$（水平直線）

### 3.2 湧き出し・吸い込み

**複素ポテンシャル**：
$$w = \frac{m}{2\pi} \ln z$$

ここで $m$ は湧き出し強度（$m > 0$：湧き出し、$m < 0$：吸い込み）。

**極座標での速度**：
$$u_r = \frac{m}{2\pi r}, \quad u_\theta = 0$$

**流線**：$\theta = \text{const}$（放射状直線）

### 3.3 循環流（渦）

**複素ポテンシャル**：
$$w = -i\frac{\Gamma}{2\pi} \ln z$$

ここで $\Gamma$ は循環。

**極座標での速度**：
$$u_r = 0, \quad u_\theta = \frac{\Gamma}{2\pi r}$$

**流線**：$r = \text{const}$（同心円）

### 3.4 二重極

**複素ポテンシャル**：
$$w = \frac{\mu}{2\pi z}$$

ここで $\mu$ は二重極の強度。

**直交座標での速度**：
$$u_x = \frac{\mu}{2\pi} \frac{x^2 - y^2}{(x^2 + y^2)^2}, \quad u_y = \frac{\mu}{2\pi} \frac{2xy}{(x^2 + y^2)^2}$$

---

## 4. 物体まわりの流れ

### 4.1 円柱まわりの流れ

半径 $a$ の円柱まわりの流れは、一様流と二重極の重ね合わせ：

$$w = U\left(z + \frac{a^2}{z}\right)$$

**境界条件**：
円柱表面 $|z| = a$ で法線速度がゼロ。

**速度場**（極座標）：
$$u_r = U\left(1 - \frac{a^2}{r^2}\right)\cos\theta$$
$$u_\theta = -U\left(1 + \frac{a^2}{r^2}\right)\sin\theta$$

**圧力分布**：
ベルヌーイの定理より：
$$p = p_\infty + \frac{1}{2}\rho U^2\left(1 - 4\sin^2\theta\right)$$

### ダランベールのパラドックス

円柱に作用する抗力：
$$D = \oint p \cos\theta \, a d\theta = 0$$

理想流体では抗力が発生しない。

### 4.2 クッタ・ジューコフスキーの定理

循環 $\Gamma$ を持つ物体まわりの流れに作用する**揚力**：

$$\boxed{L = \rho U \Gamma}$$

### 証明の詳細

#### ステップ1：物体に作用する力の一般式

物体表面に作用する力は圧力積分により求められる：

$$F_x + iF_y = \oint_C p \mathbf{n} \, ds$$

ここで $\mathbf{n}$ は物体表面の外向き単位法線ベクトル。

複素平面では、物体表面の要素 $ds$ と法線ベクトルの関係：
$$\mathbf{n} \, ds = i \, dz$$

#### ステップ2：ベルヌーイの定理の適用

定常流れでのベルヌーイの定理：
$$p + \frac{1}{2}\rho |\mathbf{u}|^2 = p_\infty + \frac{1}{2}\rho U^2$$

したがって：
$$p - p_\infty = \frac{1}{2}\rho (U^2 - |\mathbf{u}|^2)$$

#### ステップ3：複素速度の表現

複素速度：
$$\frac{dw}{dz} = u_x - iu_y$$

速度の大きさ：
$$|\mathbf{u}|^2 = u_x^2 + u_y^2 = \left|\frac{dw}{dz}\right|^2$$

#### ステップ4：力の積分表現

力の積分は：
$$F_x + iF_y = i\oint_C p \, dz = i\oint_C \left[p_\infty + \frac{1}{2}\rho (U^2 - \left|\frac{dw}{dz}\right|^2)\right] dz$$

第1項は閉曲線積分でゼロ、第2項の $U^2$ もゼロなので：

$$F_x + iF_y = -\frac{i\rho}{2}\oint_C \left|\frac{dw}{dz}\right|^2 dz$$

#### ステップ5：複素共役の利用

$$\left|\frac{dw}{dz}\right|^2 = \frac{dw}{dz} \overline{\frac{dw}{dz}}$$

物体表面では、境界条件より $\frac{dw}{dz}$ の虚部がゼロ（接線流れのみ）であることを利用すると：

$$F_x + iF_y = -\frac{i\rho}{2}\oint_C \left(\frac{dw}{dz}\right)^2 dz$$

#### ステップ6：留数定理の適用

$\frac{dw}{dz}$ を物体外部で解析的な関数として、無限遠での挙動を考える：

$$\frac{dw}{dz} = U + \frac{A_1}{z} + \frac{A_2}{z^2} + \cdots$$

ここで循環がある場合：
$$A_1 = -i\frac{\Gamma}{2\pi}$$

#### ステップ7：積分の評価

$$\left(\frac{dw}{dz}\right)^2 = U^2 + \frac{2UA_1}{z} + O(z^{-2})$$

留数定理により：
$$\oint_C \left(\frac{dw}{dz}\right)^2 dz = 2\pi i \cdot 2UA_1 = 2\pi i \cdot 2U \cdot \left(-i\frac{\Gamma}{2\pi}\right) = 2U\Gamma$$

#### ステップ8：最終結果

$$F_x + iF_y = -\frac{i\rho}{2} \cdot 2U\Gamma = -i\rho U\Gamma$$

実部と虚部を分離すると：
- $F_x = 0$ （抗力はゼロ：ダランベールのパラドックス）
- $F_y = \rho U\Gamma$ （揚力）

したがって：
$$\boxed{L = \rho U \Gamma}$$

これがクッタ・ジューコフスキーの定理です。

#### 物理的解釈

- **循環 $\Gamma > 0$**：反時計回りの循環 → 上向きの揚力
- **循環 $\Gamma < 0$**：時計回りの循環 → 下向きの揚力
- **循環 $\Gamma = 0$**：揚力ゼロ

この定理は、物体形状に関係なく、循環さえあれば揚力が発生することを示しています。

---

## 5. 境界層理論の基礎

### レイノルズ数と流れの特性

$$Re = \frac{\rho U L}{\mu}$$

- **高レイノルズ数**：慣性力 >> 粘性力
- **低レイノルズ数**：粘性力 >> 慣性力

### プラントルの境界層概念

高レイノルズ数流れでは：

1. **主流域**：粘性効果無視（ポテンシャル流れ）
2. **境界層**：壁近傍の薄い層で粘性効果が重要

### 境界層厚さ

$$\boxed{\delta \sim \sqrt{\frac{\mu x}{\rho U}} \sim \frac{x}{\sqrt{Re_x}}}$$

ここで $Re_x = \frac{\rho U x}{\mu}$ は局所レイノルズ数。

### 境界層方程式

**連続方程式**：
$$\frac{\partial u}{\partial x} + \frac{\partial v}{\partial y} = 0$$

**運動量方程式**：
$$u\frac{\partial u}{\partial x} + v\frac{\partial u}{\partial y} = U\frac{dU}{dx} + \nu\frac{\partial^2 u}{\partial y^2}$$

**境界条件**：
- 壁面：$u = v = 0$ （粘着条件）
- 境界層外縁：$u \to U(x)$

### ブラジウス解

平板上の層流境界層（$U = \text{const}$）の相似解：

$$\eta = y\sqrt{\frac{U}{\nu x}}, \quad f(\eta) = \frac{\psi}{\sqrt{\nu U x}}$$

境界層厚さ：
$$\delta = 5.0\sqrt{\frac{\nu x}{U}}$$

壁面摩擦応力：
$$\tau_w = 0.332\rho U^2\sqrt{\frac{\nu}{\nu x}}$$

---

## まとめ

### 基本概念

1. **渦度**：$\boldsymbol{\omega} = \nabla \times \mathbf{u}$
2. **流れ関数**：$u_x = \frac{\partial \psi}{\partial y}$, $u_y = -\frac{\partial \psi}{\partial x}$
3. **速度ポテンシャル**：$\mathbf{u} = \nabla \phi$
4. **複素ポテンシャル**：$w = \phi + i\psi$

### 重要な定理

- **ケルビンの循環定理**：理想流体で循環は保存される
- **クッタ・ジューコフスキーの定理**：$L = \rho U \Gamma$
- **ヘルムホルツの渦定理**：渦管の性質

### 流れの分類

| 流れの種類 | 特徴 | 支配方程式 |
|------------|------|------------|
| **ポテンシャル流れ** | 非回転・非圧縮 | $\nabla^2 \phi = 0$ |
| **渦流れ** | 回転あり | $\nabla^2 \psi = -\omega_z$ |
| **境界層流れ** | 高Re・粘性効果 | 境界層方程式 |

### 次回予定

- 乱流理論の基礎
- 圧縮性流体力学
- 数値流体力学入門 