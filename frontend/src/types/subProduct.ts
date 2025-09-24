/**
 * SubProduct related type definitions
 */

// Enum for sub-product status
export enum SubProductStatus {
  ACTIVE = 'ACTIVE',
  INACTIVE = 'INACTIVE',
  DEACTIVE = 'DEACTIVE'
}

// SubProduct request DTO
export interface SubProductRequestDTO {
  subProductCode: string;
  subProductName: string;
  productId: number;
  interestRate: number;
  term?: number;
  termCode?: string;
  cumGlNum: string;
  interestGlNum: string;
  status: SubProductStatus;
  makerId: string;
}

// SubProduct response DTO
export interface SubProductResponseDTO {
  subProductId: number;
  subProductCode: string;
  subProductName: string;
  productId: number;
  productCode?: string;
  productName?: string;
  interestRate: number;
  term?: number;
  termCode?: string;
  cumGlNum: string;
  interestGlNum: string;
  status: SubProductStatus;
  makerId: string;
  entryDate: string; // LocalDate as ISO string
  entryTime: string; // LocalTime as ISO string
  verifierId?: string;
  verificationDate?: string; // LocalDate as ISO string
  verificationTime?: string; // LocalTime as ISO string
  verified: boolean;
}
