defmodule HMC5883L.CompassConfiguration do
  defstruct averaging: 8, data_rate: 15, bias: :normal, gain: 1.3, mode: :continuous, gauss: {1090, 980}
  @type t :: %__MODULE__{averaging: number, data_rate: number, bias: atom, gain: number, mode: atom, gauss: {number, number}}


  @moduledoc """
  This structure holds the values needed to fully configure the HMC5883L compass, this should be the desired initial state of the compass.

  averaging: Samples Averaged
    number of samples averaged (1 to 8) per measurement output. 1, 2, 4 or 8 (Default)

  data_rate: Data Output Rate (Hz)
    The rate at which data is written to all three data output registers.
    0.75, 1.5, 3.0, 7.5, 15.0 (Default), 30.0 and 70.0

  bias: Measurement Configuration Bias
    The measurement flow of the device, specifically whether or not to incorporate an applied bias into the measurement.

    :normal - Normal measurement configuration (Default).
      In normal measurement configuration the device follows normal measurement flow. The positive and negative pins of the resistive load are left floating and high impedance.
    :positive - Positive bias configuration
      Positive bias configuration for X, Y, and Z axes. In this configuration, a positive current is forced across the resistive load for all three axes.

    :negative - Negative bias configuration
      Negative bias configuration for X, Y and Z axes. In this configuration, a negative current is forced across the resistive load for all three axes

  gain: Gain Configuration
    Sets the gain for all channels on the device (X, Y & Z) in either sensor field range or LSb / Gauss values.

    Choose a lower gain value when total field strength causes overflow in one of the data output registers (saturation). Note that the very first measurement after a gain change maintains the same gain as the previous setting.

    Sensor Field Range| Gain (LSb / Gauss) | Digital Resolution (Scale) mG /LSb
    ---|---|---|
    ±0.88|1370|0.73
    ±1.3|1090|0.92 (Default)
    ±1.9|820|1.22
    ±2.5|660|1.52
    ±4.0|440|2.27
    ±4.7|390|2.56
    ±5.6|330|3.03
    ±8.1|230|4.35

  mode:
    The operation mode of the device.

    :continuous (Default) - Continuous-Measurement Mode.
      In continuous-measurement mode, the device continuously performs measurements and places the result in the data register.

    :single - Single-Measurement Mode.
      When single-measurement mode is selected, device performs a single measurement, sets RDY high and returned to idle mode
    :idle - Idle Mode
      The device is idle and not taking measurements
  scale:
    The scale is a float that is used to adjust the raw compass reading based on the current gain.
    Scale is used to calculate the heading. This value is set based on the current gain value.
    Scale should be looked up in the CompassUtilities.get_scale/1 function and set anytime the gain value
    is changed. It is saved in the configuration for convience in calculations and not performing a lookup on
    every heading read.
  """
end
