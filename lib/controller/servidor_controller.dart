import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lxserv/model/servidor_model.dart';

class ServidorController {
  FirebaseFirestore db = FirebaseFirestore.instance;

  criarServidor(appt, {name, service, time}) async {
    final docRef = db.collection('servidores').doc();
    await docRef.set(appt.toMap()).then(
        (value) => log("Servidor Criada com Sucesso!"),
        onError: (e) => log("Erro ao criar empresa: $e"));
  }

  criarServidorJson() {
    var empresas = [
      {
        "Virtualizador": "SFPROX0110",
        "HOSTNAME": "SVPMANASTACIO01",
        "IP - LAN": "172.30.5.11",
        "IP - WAN": "201.56.59.38",
        "Link WAN": "Embratel-DED-01",
        "Descrição": "Banco",
        "CPU": 2,
        "RAM": 8,
        "Drive": 100,
        "ACESSO EXTERNO": "pmanastacio.rcmsuporte.com.br:53011",
        "SO": "WS19ST",
        "Licença": "KMS",
        "Antivirus": "OK",
        "Virtualizadores": "SFPROX0110",
        "Links WAN": "Embratel-DED-01"
      },
      {
        "Virtualizador": "SFPROX0110",
        "HOSTNAME": "SVPMANASTACIO02",
        "IP - LAN": "172.30.5.12",
        "IP - WAN": "201.56.59.38",
        "Link WAN": "Embratel-DED-01",
        "Descrição": "TS - Crack",
        "CPU": 4,
        "RAM": 8,
        "Drive": 100,
        "ACESSO EXTERNO": "pmanastacio.rcmsuporte.com.br:53012",
        "SO": "WS12ST",
        "Licença": "KMS",
        "Antivirus": "OK",
        "Virtualizadores": "SFPROX0220",
        "Links WAN": "Vivo-DED-01"
      },
      {
        "Virtualizador": "SFPROX0110",
        "HOSTNAME": "SVPMAQUIDAUANA01",
        "IP - LAN": "172.30.1.11",
        "IP - WAN": "201.56.59.39",
        "DNS": "dtclx01.lxtecinformatica.com.br",
        "Link WAN": "Embratel-DED-01",
        "Descrição": "Banco",
        "CPU": 4,
        "RAM": 8,
        "Drive": 150,
        "ACESSO EXTERNO": "pmaquidauana.rcmsuporte.com.br:53011",
        "SO": "WS19ST",
        "Licença": "...PKFBQ",
        "Antivirus": "OK",
        "Virtualizadores": "SFPROX0330",
        "Links WAN": "Vivo-DED-02"
      },
      {
        "Virtualizador": "SFPROX0110",
        "HOSTNAME": "SVPMAQUIDAUANA02",
        "IP - LAN": "172.30.1.12",
        "IP - WAN": "201.56.59.39",
        "DNS": "dtclx01.lxtecinformatica.com.br",
        "Link WAN": "Embratel-DED-01",
        "Descrição": "TS - AADS",
        "CPU": 4,
        "RAM": 8,
        "Drive": 150,
        "ACESSO EXTERNO": "pmaquidauana.rcmsuporte.com.br:53012",
        "SO": "WS19ST",
        "Licença": "...PKFBQ",
        "Antivirus": "OK",
        "Virtualizadores": "SFPROX0440",
        "Links WAN": "Embratel-DED-02"
      },
      {
        "Virtualizador": "SFPROX0110",
        "HOSTNAME": "SVPMCHAPADAO01",
        "IP - LAN": "172.30.0.21",
        "IP - WAN": "201.56.59.36",
        "DNS": "dtclx00.lxtecinformatica.com.br",
        "Link WAN": "Embratel-DED-01",
        "Descrição": "Banco",
        "CPU": 12,
        "RAM": 32,
        "Drive": 500,
        "ACESSO EXTERNO": "pmchapadao.rcmsuporte.com.br:53021",
        "SO": "WS19ST",
        "Licença": "...PKFBQ",
        "Antivirus": "OK",
        "Virtualizadores": "SFPROX0550",
        "Links WAN": "NET IP Fixo"
      },
      {
        "Virtualizador": "SFPROX0110",
        "HOSTNAME": "SVPMCHAPADAO02",
        "IP - LAN": "172.30.0.22",
        "IP - WAN": "201.56.59.36",
        "DNS": "dtclx00.lxtecinformatica.com.br",
        "Link WAN": "Embratel-DED-01",
        "Descrição": "Banco",
        "CPU": 2,
        "RAM": 8,
        "Drive": 100,
        "ACESSO EXTERNO": "pmchapadao.rcmsuporte.com.br:53022",
        "SO": "WS19ST",
        "Licença": "...PKFBQ",
        "Antivirus": "OK"
      },
      {
        "Virtualizador": "SFPROX0110",
        "HOSTNAME": "SVPMINOCENCIA01",
        "IP - LAN": "172.30.4.11",
        "IP - WAN": "201.56.59.40",
        "DNS": "dtclx04.lxtecinformatica.com.br",
        "Link WAN": "Embratel-DED-01",
        "Descrição": "Banco",
        "CPU": 2,
        "RAM": 8,
        "Drive": 100,
        "ACESSO EXTERNO": "pminocencia.rcmsuporte.com.br:53011",
        "SO": "WS19ST",
        "Licença": "KMS",
        "Antivirus": "OK"
      },
      {
        "Virtualizador": "SFPROX0110",
        "HOSTNAME": "SVPMINOCENCIA02",
        "IP - LAN": "172.30.4.12",
        "IP - WAN": "201.56.59.40",
        "DNS": "dtclx04.lxtecinformatica.com.br",
        "Link WAN": "Embratel-DED-01",
        "Descrição": "TS - Crack",
        "CPU": 2,
        "RAM": 8,
        "Drive": 100,
        "ACESSO EXTERNO": "pminocencia.rcmsuporte.com.br:53012",
        "SO": "WS19ST",
        "Licença": "KMS",
        "Antivirus": "OK"
      },
      {
        "Virtualizador": "SFPROX0110",
        "HOSTNAME": "SVPMPPORA01",
        "IP - LAN": "172.30.6.11",
        "IP - WAN": "201.56.59.35",
        "Link WAN": "Embratel-DED-01",
        "Descrição": "Banco - RH",
        "CPU": 8,
        "RAM": 24,
        "Drive": 150,
        "ACESSO EXTERNO": "pmpontapora.rcmsuporte.com.br:53011",
        "SO": "WS19ST",
        "Licença": "KMS",
        "Antivirus": "OK"
      },
      {
        "Virtualizador": "SFPROX0110",
        "HOSTNAME": "SVPMPPORA02",
        "IP - LAN": "172.30.6.12",
        "IP - WAN": "201.56.59.35",
        "Link WAN": "Embratel-DED-01",
        "Descrição": "Banco - Tributos",
        "CPU": 4,
        "RAM": 16,
        "Drive": 200,
        "ACESSO EXTERNO": "pmpontapora.rcmsuporte.com.br:53012",
        "SO": "WS19ST",
        "Licença": "KMS",
        "Antivirus": "OK"
      },
      {
        "Virtualizador": "SFPROX0110",
        "HOSTNAME": "SVPMPPORA03",
        "IP - LAN": "172.30.6.13",
        "IP - WAN": "201.56.59.35",
        "Link WAN": "Embratel-DED-01",
        "Descrição": "Banco - Contabil",
        "CPU": 6,
        "RAM": 32,
        "Drive": 350,
        "ACESSO EXTERNO": "pmpontapora.rcmsuporte.com.br:53013",
        "SO": "WS19ST",
        "Licença": "KMS",
        "Antivirus": "OK"
      },
      {
        "Virtualizador": "SFPROX0110",
        "HOSTNAME": "SVPMPPORA04",
        "IP - LAN": "172.30.6.14",
        "IP - WAN": "201.56.59.35",
        "Link WAN": "Embratel-DED-01",
        "Descrição": "TS - Crack",
        "CPU": 8,
        "RAM": 30,
        "Drive": 100,
        "ACESSO EXTERNO": "pmpontapora.rcmsuporte.com.br:53014",
        "SO": "WS12ST",
        "Licença": "KMS",
        "Antivirus": "OK"
      },
      {
        "Virtualizador": "SFPROX0110",
        "HOSTNAME": "SVPMSELVIRIA01",
        "IP - LAN": "172.30.7.11",
        "IP - WAN": "201.56.59.37",
        "Link WAN": "Embratel-DED-01",
        "Descrição": "Banco",
        "CPU": 2,
        "RAM": 8,
        "Drive": 100,
        "ACESSO EXTERNO": "pmselviria.rcmsuporte.com.br:53011",
        "SO": "WS19ST",
        "Licença": "KMS",
        "Antivirus": "OK"
      },
      {
        "Virtualizador": "SFPROX0110",
        "HOSTNAME": "SVPMSELVIRIA02",
        "IP - LAN": "172.30.7.12",
        "IP - WAN": "201.56.59.37",
        "Link WAN": "Embratel-DED-01",
        "Descrição": "TS - Crack",
        "CPU": 4,
        "RAM": 8,
        "Drive": 100,
        "ACESSO EXTERNO": "pmselviria.rcmsuporte.com.br:53012",
        "SO": "WS19ST",
        "Licença": "KMS",
        "Antivirus": "OK"
      },
      {
        "Virtualizador": "SFPROX0220",
        "HOSTNAME": "SVDCK0106",
        "IP - LAN": "172.30.255.6",
        "IP - WAN": "201.56.59.46",
        "Link WAN": "Embratel-DED-01",
        "Descrição": "Docker Desenv.",
        "CPU": 2,
        "RAM": 8,
        "Drive": 220,
        "SO": "Deb11",
        "Licença": "Free",
        "Antivirus": "NA"
      },
      {
        "Virtualizador": "SFPROX0220",
        "HOSTNAME": "SVDCK0207",
        "IP - LAN": "172.30.255.7",
        "IP - WAN": "201.56.59.46",
        "Link WAN": "Embratel-DED-01",
        "Descrição": "Docker Desenv.",
        "CPU": 2,
        "RAM": 8,
        "Drive": 654,
        "SO": "Deb11",
        "Licença": "Free",
        "Antivirus": "NA"
      },
      {
        "Virtualizador": "SFPROX0220",
        "HOSTNAME": "SVPMAMAMBAI01",
        "IP - LAN": "172.30.2.11",
        "IP - WAN": "201.56.59.34",
        "Link WAN": "Embratel-DED-01",
        "Descrição": "Banco",
        "CPU": 6,
        "RAM": 12,
        "Drive": 1100,
        "ACESSO EXTERNO": "pmamambai.rcmsuporte.com.br:53011",
        "SO": "WS19ST",
        "Licença": "KMS",
        "Antivirus": "OK"
      },
      {
        "Virtualizador": "SFPROX0220",
        "HOSTNAME": "SVAPPRCM01",
        "IP - LAN": "172.16.9.11",
        "IP - WAN": "191.33.225.181",
        "DNS": "dtclx09.lxtecinformatica.com.br",
        "Link WAN": "Vivo-DED-01",
        "Descrição": "Banco",
        "CPU": 4,
        "RAM": 8,
        "Drive": 250,
        "SO": "WS19ST",
        "Licença": "KMS",
        "Antivirus": "OK"
      },
      {
        "Virtualizador": "SFPROX0220",
        "HOSTNAME": "SVCMSORRISO01",
        "IP - LAN": "172.30.8.11",
        "IP - WAN": "191.33.225.178",
        "DNS": "dtclx08.lxtecinformatica.com.br",
        "Link WAN": "Vivo-DED-01",
        "Descrição": "Docker",
        "CPU": 4,
        "RAM": 16,
        "Drive": 500,
        "SO": "DEB11",
        "Licença": "Open",
        "Antivirus": "NA"
      },
      {
        "Virtualizador": "SFPROX0220",
        "HOSTNAME": "SVDC0221",
        "IP - LAN": "172.30.255.21",
        "IP - WAN": "189.7.73.65",
        "Link WAN": "NET IP Fixo",
        "Descrição": "AD Secundario",
        "CPU": 2,
        "RAM": 4,
        "Drive": 50,
        "SO": "WS19ST",
        "Licença": "KMS",
        "Antivirus": "OK"
      },
      {
        "Virtualizador": "SFPROX0220",
        "HOSTNAME": "SVPMPPORA05",
        "IP - LAN": "172.30.6.15",
        "IP - WAN": "201.56.59.35",
        "Link WAN": "Embratel-DED-01",
        "Descrição": "Docker",
        "CPU": 10,
        "RAM": 48,
        "Drive": 580,
        "ACESSO EXTERNO": "pmpontapora.rcmsuporte.com.br:53015",
        "SO": "DEB12",
        "Licença": "Free",
        "Antivirus": "NA"
      },
      {
        "Virtualizador": "SFPROX0330",
        "HOSTNAME": "SVLAB0111",
        "IP - LAN": "172.30.252.11",
        "IP - WAN": "191.33.225.182",
        "Link WAN": "Vivo-DED-01",
        "Descrição": "Laboratório ",
        "CPU": 2,
        "RAM": 4,
        "Drive": 108,
        "SO": "Alm 8",
        "Licença": "Free",
        "Antivirus": "NA"
      },
      {
        "Virtualizador": "SFPROX0330",
        "HOSTNAME": "SVLAB0212",
        "IP - LAN": "172.30.252.12",
        "IP - WAN": "191.33.225.182",
        "Link WAN": "Vivo-DED-01",
        "Descrição": "Laboratório ",
        "CPU": 2,
        "RAM": 4,
        "Drive": 108,
        "SO": "Alm 8",
        "Licença": "Free",
        "Antivirus": "NA"
      },
      {
        "Virtualizador": "SFPROX0330",
        "HOSTNAME": "SVLAB0313",
        "IP - LAN": "172.30.252.13",
        "IP - WAN": "191.33.225.182",
        "Link WAN": "Vivo-DED-01",
        "Descrição": "Laboratório ",
        "CPU": 2,
        "RAM": 4,
        "Drive": 108,
        "SO": "Alm 8",
        "Licença": "Free",
        "Antivirus": "NA"
      },
      {
        "Virtualizador": "SFPROX0330",
        "HOSTNAME": "SVLAB0414",
        "IP - LAN": "172.30.252.14",
        "IP - WAN": "191.33.225.182",
        "Link WAN": "Vivo-DED-01",
        "Descrição": "Laboratório ",
        "CPU": 2,
        "RAM": 4,
        "Drive": 108,
        "SO": "Alm 8",
        "Licença": "Free",
        "Antivirus": "NA"
      },
      {
        "Virtualizador": "SFPROX0550",
        "HOSTNAME": "SVPMCACOAL01",
        "IP - LAN": "172.30.10.11 - 172.30.250.10",
        "IP - WAN": "177.174.64.34",
        "Link WAN": "Vivo-DED-02",
        "Descrição": "Docker Desenv.",
        "CPU": 6,
        "RAM": 24,
        "Drive": 2608,
        "SO": "DEB11",
        "Licença": "Free",
        "Antivirus": "NA"
      },
      {
        "Virtualizador": "SFPROX0550",
        "HOSTNAME": "SVPMRCRESPO01",
        "IP - LAN": "172.30.11.11 - 172.30.250.11",
        "IP - WAN": "177.174.64.36",
        "Link WAN": "Vivo-DED-02",
        "Descrição": "Docker Desenv.",
        "CPU": 4,
        "RAM": 16,
        "Drive": 324,
        "SO": "DEB11",
        "Licença": "Free",
        "Antivirus": "NA"
      },
      {
        "Virtualizador": "SFPROX0550",
        "HOSTNAME": "SVPMSMGUAPORE01",
        "IP - LAN": "172.30.12.11 - 172.30.250.12",
        "IP - WAN": "177.174.64.37",
        "Link WAN": "Vivo-DED-02",
        "Descrição": "Docker Desenv.",
        "CPU": 4,
        "RAM": 16,
        "Drive": 324,
        "SO": "DEB11",
        "Licença": "Free",
        "Antivirus": "NA"
      },
      {
        "Virtualizador": "SFPROX0550",
        "HOSTNAME": "SVPMVILHENA01",
        "IP - LAN": "172.30.3.11 - 172.30.250.3 ",
        "IP - WAN": "177.174.64.35",
        "Link WAN": "Vivo-DED-02",
        "Descrição": "Docker Desenv.",
        "CPU": 6,
        "RAM": 32,
        "Drive": 2124,
        "SO": "DEB11",
        "Licença": "Free",
        "Antivirus": "NA"
      },
      {
        "Virtualizador": "SFPROX0550",
        "HOSTNAME": "SVPMCHAPADAO03",
        "IP - LAN": "172.30.0.23",
        "IP - WAN": "201.56.59.36",
        "Link WAN": "Embratel-DED-01",
        "Descrição": "Docker Desenv.",
        "CPU": 4,
        "RAM": 16,
        "Drive": 101,
        "ACESSO EXTERNO": "pmchapadao.rcmsuporte.com.br:53023",
        "SO": "WS12ST",
        "Licença": "KMS",
        "Antivirus": "NA"
      }
    ];

    final docRef = db.collection('servidores').doc();
    /*idHost: element['idHost'].toString(),
                            hostname: element['hostname'].toString(),
                            descricao: element['descricao'].toString(),
                            so: element['so'].toString(),
                            iplan: element['iplan'].toString(),
                            ipwan: element['ipwan'].toString(),
                            linkWAN: element['linkWAN'].toString(),
                            cpu: int.parse(element['cpu'].toString()),
                            ram: int.parse(element['ram'].toString()),
                            drive: double.parse(element['drive'].toString()),
                            licenca: element['licenca'].toString(),
                            antivirus: element['antivirus'].toString(),
                            dtCreated: DateTime.now());*/

    empresas.forEach((element) async {
      //ServidorModel servidor = ServidorModel(idCompany: "13505252000114", idHost: element.idHost, host: host, hostname: hostname, descricao: descricao, status: status, so: so, iplan: iplan, ipwan: ipwan, linkWAN: linkWAN, cpu: cpu, ram: ram, drive: drive, acessoExterno: acessoExterno, licenca: licenca, antivirus: antivirus, backup: backup, dtCreated: dtCreated)
      await docRef.set(element).then(
          (value) => log("Empresa Criada com Sucesso!"),
          onError: (e) => log("Erro ao criar empresa: $e"));
    });
  }

  getServidoresCnpj(String? cnpj) async {
    late ServidorModel model;
    late List<ServidorModel> servidores = [];
    final docRef = db.collection('servidores').get();

    try {
      await docRef.then((event) {
        for (var doc in event.docs) {
          model = ServidorModel(
            img: doc.data()['img'],
            idCompany: doc.data()['idCompany'],
            idHost: doc.data()['idHost'],
            host: doc.data()['host'],
            hostname: doc.data()['hostname'],
            descricao: doc.data()['descricao'],
            status: doc.data()['status'],
            so: doc.data()['so'],
            iplan: doc.data()['iplan'],
            ipwan: doc.data()['ipwan'],
            linkWAN: doc.data()['linkWAN'],
            cpu: doc.data()['cpu'],
            ram: doc.data()['ram'],
            drive: doc.data()['drive'],
            licenca: doc.data()['licenca'],
            acessoExterno: doc.data()['acessoExterno'],
            antivirus: doc.data()['antivirus'],
            backup: doc.data()['backup'],
            dtCreated: doc.data()['dtCreated'].toDate(),
          );
          if (cnpj == null) {
            servidores.add(model);
          } else if (cnpj == model.idCompany) {
            servidores.add(model);
          }
        }
      });
    } catch (e) {
      print(e);
    }

    return servidores;
  }

  getServidores() async {
    late ServidorModel model;
    late List<ServidorModel> servidores = [];
    final docRef = db.collection('servidores').get();

    await docRef.then((event) {
      for (var doc in event.docs) {
        model = ServidorModel(
          img: doc.data()['img'],
          idCompany: doc.data()['idCompany'],
          idHost: doc.data()['idHost'],
          host: doc.data()['host'],
          hostname: doc.data()['hostname'],
          descricao: doc.data()['descricao'],
          status: doc.data()['status'],
          so: doc.data()['so'],
          iplan: doc.data()['iplan'],
          ipwan: doc.data()['ipwan'],
          linkWAN: doc.data()['linkWAN'],
          cpu: doc.data()['cpu'],
          ram: doc.data()['ram'],
          drive: doc.data()['drive'],
          licenca: doc.data()['licenca'],
          acessoExterno: doc.data()['acessoExterno'],
          antivirus: doc.data()['antivirus'],
          backup: doc.data()['backup'],
          dtCreated: doc.data()['dtCreated'].toDate(),
        );
        servidores.add(model);
      }
    });

    return servidores;
  }
}
