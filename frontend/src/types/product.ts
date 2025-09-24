/**
 * Product related type definitions
 */

// Product request DTO
export interface ProductRequestDTO {
  productCode: string;
  productName: string;
  productType: string;
  makerId: string;
}

// Product response DTO
export interface ProductResponseDTO {
  productId: number;
  productCode: string;
  productName: string;
  productType: string;
  makerId: string;
  entryDate: string; // LocalDate as ISO string
  entryTime: string; // LocalTime as ISO string
  verifierId?: string;
  verificationDate?: string; // LocalDate as ISO string
  verificationTime?: string; // LocalTime as ISO string
  verified: boolean;
}
