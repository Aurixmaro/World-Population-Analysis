import matplotlib.pyplot as plt
import numpy as np


x = np.random.rand(1000) 
y = np.random.rand(1000)  
plt.scatter(x, y, s=5, c='b', alpha=0.5) 
plt.xlim(0, 1)
plt.ylim(0, 1)
plt.legend().set_visible(False)
plt.title('') 
plt.text(0.5, 0.5, "Analysis of World Population", fontsize=16, ha='center', va='center', color='black', fontweight='bold')
x_trend1 = np.linspace(0, 1, 100)
y_trend1 = 0.2 + 0.6 * (x_trend1 - 0.2)
plt.plot(x_trend1, y_trend1, c='r', linestyle='--', linewidth=2)
x_trend2 = np.linspace(0, 1, 100)
y_trend2 = 0.7 + 0.2 * (x_trend2 - 0.1)
plt.plot(x_trend2, y_trend2, c='g', linestyle='--', linewidth=2)
x_trend3 = np.linspace(0, 1, 100)
y_trend3 = 0.3 + 0.4 * (x_trend3 - 0.3)
plt.plot(x_trend3, y_trend3, c='purple', linestyle='--', linewidth=2)
x_trend4 = np.linspace(0, 1, 100)
y_trend4 = 0.8 - 0.6 * (x_trend4 - 0.8)
plt.plot(x_trend4, y_trend4, c='yellow', linestyle='--', linewidth=2)
x_trend5 = np.linspace(0, 1, 100)
y_trend5 = 0.1 + 0.1 * (x_trend5 - 0.1)
plt.plot(x_trend5, y_trend5, c='gray', linestyle='--', linewidth=2)

plt.show()