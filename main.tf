resource "proxmox_vm_qemu" "vm" {
    name        = "terraform-proxmox-vm"
    target_node = "ilya"  
    
    # Ресурсы
    cpu {
        cores   = 2
        sockets = 1
    }
    memory  = 2048
    
    # Диск
    disk {
        slot    = "scsi0"
        type    = "disk"
        storage = "local-lvm"
        size    = "20G"
    }
    
    # Сеть
    network {
        id      = 0
        model   = "virtio"
        bridge  = "vmbr0"
    }
    
    # SSH ключ
    sshkeys = var.ssh_public_key
    
    # BIOS
    bios = "seabios"
    
    # Агент QEMU
    qemu_os = "l26"  # Linux 2.6+
    
    # Отключение KVM 
    kvm = false
    
    # Cloud-init настройки 
    # ciuser     = "ilya"
    # ipconfig0  = "ip=192.168.0.203/24,gw=192.168.0.1"
     
    vm_state = "stopped"
    
    # Не запускать VM автоматически при загрузке узла
    start_at_node_boot = false
    
    define_connection_info = false
}