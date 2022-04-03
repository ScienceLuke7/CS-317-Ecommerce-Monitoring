import string

class WatchList:
    ProductGTIN: int
    ProductModelNumber: int
    ProductName: string
    DesiredPrice: float

    def __init__(self): return

"""     def serialize(self):
        return {
            'ProductGTIN': self.ProductGTIN,
            'ProductModelNumber': self.ProductModelNumber,
            'ProductName': self.ProductName,
            'DesiredPrice': self.DesiredPrice
        } """