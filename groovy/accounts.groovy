import groovy.xml.XmlSlurper
import groovy.xml.MarkupBuilder
import groovy.json.JsonOutput
import org.apache.camel.Exchange

def executeMessage(String message) {

    def inputXml = message.getIn().getBody(String.class)

    def xml = new XmlSlurper().parseText(inputXml)

    def outputXml = new StringWriter()
    def xmlBuilder = new MarkupBuilder(outputXml)


    xmlBuilder.'ns0:EAIntervalResponse'('xmlns:ns0': 'http://elektronikhesap.org/schema/xsd/v1') {
    'ns0:StatusCode'()
    'ns0:StatusDescription'()
    'ns0:BankAccount'()
    'ns0:BankName'()
    'ns0:BankTaxOffice'()
    'ns0:BankTaxNumber'()
    'ns0:AccountList' {
        xml.AccountReportResult.AccountDetail.BankaHesaplariClassDetail.BankaHesaplari.HesapBilgisiDetail.HesapTanimi.each { HesapTanimi ->

            'ns0:Account' {
            'ns0:BranchName'(HesapTanimi.SubeAdi.text())
            'ns0:BranchCode'(HesapTanimi.SubeNumarasi.text())
            'ns0:AccountNumber'(HesapTanimi.HesapNumarasi.text())
            'ns0:AccountType'(HesapTanimi.HesapTuru.text())
            'ns0:AccountName'(HesapTanimi.HesapAdi.text())
            'ns0:CustomerNumber'(HesapTanimi.MusteriNo.text())
            'ns0:CurrencyType'(HesapTanimi.HesapCinsi.text())
            'ns0:AccountOpeningDate'(handleDates(HesapTanimi.AcilisTarihi.text()))
            'ns0:AccountOpeningTime'()
            'ns0:LastActivityDate'(handleDates(HesapTanimi.SonHareketTarihi.text()))
            'ns0:LastActivityTime'()
            'ns0:BlockedAmount'(HesapTanimi.BlokeMeblag.text())
            'ns0:AvailableBalanceWithCredit'(HesapTanimi.KrediliKullanilabilirBakiye.text())
            'ns0:AvailableBalance'(HesapTanimi.KullanilabilirBakiye.text())
            'ns0:OpeningBalance'()
            'ns0:InitialOpeningBalance'()
            'ns0:IBAN'()
            'ns0:CustomerName'()
            'ns0:InterestRate'(HesapTanimi.FaizOrani.text())
            'ns0:DueDate'(handleDates(HesapTanimi.VadeTarihi.text()))
            'ns0:CreditLimit'(HesapTanimi.KrediLimiti.text())
            'ns0:DueTime'()
            'ns0:ActivityList'()
            }
        }
    }
    }

    message.getIn().setBody(outputXml.toString())

}

String handleDates(String date) {
    if(date) {
        def (day, month, year) = date.split('/')
        return "${year}${month}${day}"
    }
    return
}


