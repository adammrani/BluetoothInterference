package simulations;

import inet.node.inet.WirelessHost;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.physicallayer.wireless.common.medium.RadioMedium;
import inet.visualizer.canvas.integrated.IntegratedCanvasVisualizer;

//
// BluetoothNode - Bluetooth device (low power, short range)
//
module BluetoothNode extends WirelessHost
{
    parameters:
        numWlanInterfaces = 1;
        @display("i=device/laptop");
}

//
// AttackerNode - Jammer or traffic injector
//
module AttackerNode extends WirelessHost
{
    parameters:
        numWlanInterfaces = 1;
        @display("i=device/pc2;is=s");
}

//
// BluetoothNetwork - Piconet with 2 attackers
//
//   Architecture:
//     master (400,300)
//       |-- slave1 (250,200)
//       |-- slave2 (550,200)
//       |-- slave3 (400,450)
//     attacker1 (150,450)  <- jammer
//     attacker2 (650,450)  <- traffic injector
//
network BluetoothNetwork
{
    parameters:
        @display("bgb=800,600");

    submodules:

        visualizer: IntegratedCanvasVisualizer {
            @display("p=50,50");
        }

        radioMedium: RadioMedium {
            @display("p=50,150");
        }

        configurator: Ipv4NetworkConfigurator {
            @display("p=50,250");
        }

        master: BluetoothNode {
            @display("p=400,300");
        }

        slave1: BluetoothNode {
            @display("p=250,200");
        }

        slave2: BluetoothNode {
            @display("p=550,200");
        }

        slave3: BluetoothNode {
            @display("p=400,450");
        }

        attacker1: AttackerNode {
            @display("p=150,450");
        }

        attacker2: AttackerNode {
            @display("p=650,450");
        }
}
