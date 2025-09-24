/**
 * SubProduct API service
 */
import type { CustomerVerificationDTO, Page, SubProductRequestDTO, SubProductResponseDTO } from '../types';
import { apiRequest } from './apiClient';

const SUBPRODUCTS_ENDPOINT = '/subproducts';

/**
 * Get all sub-products with pagination
 */
export const getAllSubProducts = async (page = 0, size = 10, sort?: string): Promise<Page<SubProductResponseDTO>> => {
  let url = `${SUBPRODUCTS_ENDPOINT}?page=${page}&size=${size}`;
  if (sort) {
    url += `&sort=${sort}`;
  }
  
  console.log('Fetching subproducts from URL:', url);
  try {
    const response = await apiRequest<Page<SubProductResponseDTO>>({
      method: 'GET',
      url,
    });
    console.log('Subproducts response:', response);
    return response;
  } catch (error) {
    console.error('Error fetching subproducts:', error);
    throw error;
  }
};

/**
 * Get sub-product by ID
 */
export const getSubProductById = async (id: number): Promise<SubProductResponseDTO> => {
  return apiRequest<SubProductResponseDTO>({
    method: 'GET',
    url: `${SUBPRODUCTS_ENDPOINT}/${id}`,
  });
};

/**
 * Create a new sub-product
 */
export const createSubProduct = async (subProduct: SubProductRequestDTO): Promise<SubProductResponseDTO> => {
  return apiRequest<SubProductResponseDTO>({
    method: 'POST',
    url: SUBPRODUCTS_ENDPOINT,
    data: subProduct,
  });
};

/**
 * Update an existing sub-product
 */
export const updateSubProduct = async (id: number, subProduct: SubProductRequestDTO): Promise<SubProductResponseDTO> => {
  return apiRequest<SubProductResponseDTO>({
    method: 'PUT',
    url: `${SUBPRODUCTS_ENDPOINT}/${id}`,
    data: subProduct,
  });
};

/**
 * Verify a sub-product (maker-checker process)
 */
export const verifySubProduct = async (id: number, verification: CustomerVerificationDTO): Promise<SubProductResponseDTO> => {
  return apiRequest<SubProductResponseDTO>({
    method: 'POST',
    url: `${SUBPRODUCTS_ENDPOINT}/${id}/verify`,
    data: verification,
  });
};
