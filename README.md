# Pandemic Simulator

## Project Overview

The Pandemic Simulator is a MATLAB-based tool designed to simulate various 'flatten the curve' scenarios during a pandemic. It calculates the impact of different waves of infections on hospital bed occupancy and estimates the resultant deaths based on the availability of medical care. This simulator aims to help public health officials, researchers, and the general public understand the importance of measures to control the spread of infectious diseases and the critical role of hospital capacity in saving lives.

### Features

- Simulates multiple waves of a pandemic with adjustable parameters for infection rates, recovery times, and more.
- Models hospital bed availability and the effect of exceeding capacity on mortality rates.
- Offers three different scenarios to compare outcomes and understand the effects of interventions.
- Incorporates randomness to more accurately reflect the unpredictable nature of real-world infections.

## Getting Started

### Prerequisites

- MATLAB R2020a or later.

### Installation

1. Clone the repository to your local machine:
    ```sh
    git clone https://github.com/yourusername/pandemic-simulator.git
    ```
2. Open MATLAB.
3. Navigate to the cloned project directory.
4. Open `PandemicSimulator.m` script.

### Usage

To run the simulation:

1. Configure the simulation parameters in `PandemicSimulator.m` according to your scenario. Parameters include population size, number of hospital beds, infection rates, and more.
2. Run the script in MATLAB.
3. Analyze the output graphs and data for insights into the pandemic's progression under different scenarios.

## Configuration

Detailed information on how to configure the simulation parameters:

- `N`: Total population size.
- `I₀`: Initial number of infections.
- `B`: Total hospital beds available.
- `β`: Infection rate.
- `γ`: Recovery rate.
- `HSD`: Hospital Stay Duration.
- `M`: Mortality rate for untreated patients.

Adjust these parameters based on the scenario you wish to simulate.

## Contributing

We welcome contributions to the Pandemic Simulator! If you have suggestions for improvements or bug fixes, please follow the steps below:

1. Fork the repository.
2. Create your feature branch (`git checkout -b feature/AmazingFeature`).
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`).
4. Push to the branch (`git push origin feature/AmazingFeature`).
5. Open a pull request.

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Contact

Your Name - kinaamine@gmail.com
Project Link: [https://github.com/Amineki6/pandemic-simulator]([https://github.com/yourusername/pandemic-simulator](https://github.com/Amineki6/Pandemic-Simulation-with-MatLab)https://github.com/Amineki6/Pandemic-Simulation-with-MatLab)
