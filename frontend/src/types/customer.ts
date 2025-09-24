/**
 * Customer related type definitions
 */

// Enum for customer type
export enum CustomerType {
  INDIVIDUAL = 'INDIVIDUAL',
  CORPORATE = 'CORPORATE'
}

// Customer request DTO
export interface CustomerRequestDTO {
  extCustId: string;
  custType: CustomerType;
  firstName?: string;
  lastName?: string;
  tradeName?: string;
  address1?: string;
  mobile?: string;
  makerId: string;
}

// Customer response DTO
export interface CustomerResponseDTO {
  custId: number;
  extCustId: string;
  custType: CustomerType;
  firstName?: string;
  lastName?: string;
  tradeName?: string;
  address1?: string;
  mobile?: string;
  makerId: string;
  entryDate: string; // LocalDate as ISO string
  entryTime: string; // LocalTime as ISO string
  verifierId?: string;
  verificationDate?: string; // LocalDate as ISO string
  verificationTime?: string; // LocalTime as ISO string
  verified: boolean;
}

// Customer verification DTO
export interface CustomerVerificationDTO {
  verifierId: string;
}
